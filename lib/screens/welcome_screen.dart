import 'package:flutter/material.dart';
import '../utils/app_styles.dart'; // Importar estilos

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener las dimensiones de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isWeb = screenWidth >
        600; // Detectamos si estamos en un dispositivo web (pantalla ancha)

    // Ajustamos el tamaño de la fuente según el dispositivo
    final maxFontSize = isWeb
        ? 20.0
        : screenWidth *
            0.07; // En web no más de 16px, en móviles depende del ancho
    final maxSubFontSize =
        isWeb ? 14.0 : screenWidth * 0.035; // Subtítulos más pequeños

    final size_title = 0.004;
    final size_text = 0.003;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            children: [
              // Header
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.05),
                child: Column(
                  children: [
                    // Logo
                    Image.asset(
                      'assets/logo.png', // Asegúrate de agregar tu logo aquí
                      height: screenHeight * 0.1,
                    ),
                    SizedBox(height: screenHeight * 0.01),

                    // Título de la App
                    Text(
                      "CrediMora App",
                      style: TextStyle(
                        fontSize: isWeb
                            ? 16.0
                            : screenWidth * 0.07, // Limite de 16px en web
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * size_title),

                    // Subtítulo
                    Text(
                      "Effortless Transactions with Success",
                      style: TextStyle(
                        fontSize: isWeb
                            ? 12.0
                            : screenWidth * 0.035, // Limite de 12px en web
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Espacio entre el header y los pasos
              SizedBox(height: screenHeight * size_title),

              // Steps
              Column(
                children: List.generate(4, (index) {
                  final titles = [
                    "Estás reportado en centrales",
                    "No te dan oportunidad de financiamiento",
                    "Necesitas capital y quieres mejorar tus finanzas",
                    "Accede a nuestra aplicación y consigue recursos"
                  ];

                  return Container(
                    margin: EdgeInsets.only(bottom: screenHeight * 0.03),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Número en círculo
                        Container(
                          height: screenWidth * 0.10,
                          width: screenWidth * 0.10,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                fontSize: screenWidth * 0.04, // 4% del ancho
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),

                        // Contenido del paso
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                titles[index],
                                style: TextStyle(
                                  fontSize: isWeb
                                      ? 16.0
                                      : screenWidth *
                                          0.045, // Limite de 16px en web
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: screenHeight * size_text),
                              Text(
                                "Lorem ipsum dolor sit amet",
                                style: TextStyle(
                                  fontSize: isWeb
                                      ? 12.0
                                      : screenWidth *
                                          0.035, // Limite de 12px en web
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),

              // Botón de login
              SizedBox(height: screenHeight * 0.05),
              ElevatedButton(
                onPressed: () {
                  // Acción del botón
                  Navigator.pushReplacementNamed(context, '/');
                },
                style: AppStyles.elevatedButtonStyle(),
                child: Text(
                  "Log in",
                  style: TextStyle(
                    fontSize: isWeb
                        ? 16.0
                        : screenWidth * 0.045, // Limite de 16px en web
                    color: Colors.white,
                  ),
                ),
              ),

              // Footer
              SizedBox(height: screenHeight * 0.03),
              Text(
                "www.credimora.com",
                style: AppStyles.elevatedButtonTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
