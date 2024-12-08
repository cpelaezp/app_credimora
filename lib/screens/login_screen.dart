import 'package:flutter/material.dart';
import '../utils/app_styles.dart'; // Importar estilos

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del logo
            Center(
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                height: 100, // Tamaño del logo
              ),
            ),
            SizedBox(height: 20),
            // Título de la app
            Center(
              child: Text(
                "CrediMora App",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            // Campo de usuario
            TextField(
              decoration: InputDecoration(
                labelText: 'Usuario',
                prefixIcon: Icon(Icons.person), // Ícono al inicio
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                ),
              ),
            ),
            SizedBox(height: 20),
            // Campo de contraseña
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock), // Ícono al inicio
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                ),
              ),
            ),
            SizedBox(height: 30),
            // Botón de inicio de sesión
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: AppStyles.elevatedButtonStyle(), // Aplica el estilo definido
                child: Text(
                  'Iniciar Sesión',
                  style: AppStyles.elevatedButtonTextStyle(), // Aplica el estilo de texto
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
