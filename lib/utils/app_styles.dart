import 'package:flutter/material.dart';

class AppStyles {
  // Estilo para botones elevados
  static ButtonStyle elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.teal, // Color de fondo
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Bordes redondeados
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Espaciado interno
    );
  }

  // Estilo para el texto de los botones
  static TextStyle elevatedButtonTextStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white, // Color del texto
    );
  }
}
