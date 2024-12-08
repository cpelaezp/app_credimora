import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/puntos_screen.dart';
import 'screens/evaluacion_screen.dart';
import 'screens/welcome_screen.dart'; // Nueva pantalla de bienvenida
import 'screens/chat_screen.dart';
import 'screens/payments_screen.dart';

void main() {
  runApp(CrediMoraApp());
}

class CrediMoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrediMora App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/welcome', // Ruta inicial
      routes: {
        '/welcome': (context) => WelcomeScreen(), // Pantalla de bienvenida
        '/': (context) => LoginScreen(), // Pantalla de inicio de sesión
        '/home': (context) => MainScreen(),
        '/puntos': (context) => PuntosScreen(),
        '/evaluacion': (context) => EvaluacionScreen(),
        '/payments': (context) => PaymentsScreen(),
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Lista de pantallas que se mostrarán según el índice seleccionado
  final List<Widget> _screens = [
    HomeScreen(),
    PuntosScreen(),
    PaymentsScreen(),
    EvaluacionScreen(),
    ChatScreen(),
  ];

  // Títulos de las pantallas
  final List<String> _screenTitles = [
    'Inicio',
    'Puntos',
    'Evaluación',
    'Analitica',
    'Asesor Virtual',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Altura personalizada del AppBar
        child: AppBar(
          automaticallyImplyLeading: true, // Flecha para volver
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () {
              Navigator.pop(context); // Acción de volver
            },
          ),
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              // Imagen de fondo en el AppBar
              Image.asset(
                'assets/header.png', // Ruta de la imagen de fondo
                fit: BoxFit.cover,
              ),
              // Títulos en el AppBar
              Positioned(
                bottom: 10,
                left: 45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Credi Mora App",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      //"Inicio",
                      _screenTitles[
                          _selectedIndex], // Título dinámico de la pantalla
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor:
              Colors.transparent, // Hace el fondo del AppBar transparente
          elevation: 0, // Sin sombra
        ),
      ),
      body: _screens[
          _selectedIndex], // Muestra la pantalla según el índice seleccionado
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Prestamos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pagos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Analitica',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Asesor Virtual',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
