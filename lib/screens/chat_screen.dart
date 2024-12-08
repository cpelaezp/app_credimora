import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final String _apiKey = 'yAIU2kaQ6bxd4iDgoHklSbHOW320JXwDugv8CRcL';

  Future<void> _sendMessage() async {
    if (_textController.text.trim().isEmpty) return;

    final userMessage = _textController.text.trim();

    setState(() {
      _messages.add({
        'sender': 'user',
        'message': userMessage,
      });
    });

    _textController.clear();

    try {
      final response = await http.post(
        Uri.parse('https://api.cohere.ai/generate'),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': 'command-xlarge-nightly',
          'prompt': userMessage,
          'max_tokens': 50,
          'temperature': 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(utf8.decode(response.bodyBytes));
        final botMessage = responseData['text'] ?? 'No response from AI.';

        setState(() {
          _messages.add({
            'sender': 'bot',
            'message': botMessage,
          });
        });
      } else {
        setState(() {
          _messages.add({
            'sender': 'bot',
            'message': 'Error al conectar con la IA. Intenta nuevamente.',
          });
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({
          'sender': 'bot',
          'message': 'Hubo un problema con la conexión.',
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Descripción con imagen de robot
          Container(
            color: Colors.teal[50],
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                // Imagen del robot
                Image.asset(
                  'assets/robot.jpg', // Asegúrate de agregar esta imagen al proyecto en assets
                  height: 60,
                  width: 60,
                ),
                SizedBox(width: 10),
                // Descripción
                Expanded(
                  child: Text(
                    'Bienvenido al Chat IA. Escribe tu pregunta o mensaje y recibe respuestas rápidas y útiles. ¡Empieza escribiendo tu mensaje abajo!',
                    style: TextStyle(fontSize: 16, color: Colors.teal[900]),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          // Lista de mensajes
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              reverse: true,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                final isUser = message['sender'] == 'user';

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.teal[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message['message']!,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          // Barra inferior para enviar mensajes
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Escribe tu mensaje...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.teal),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
