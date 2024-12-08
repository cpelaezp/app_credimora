import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class EvaluacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Perfil
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
                SizedBox(width: 16),
                Text(
                  'Juan Conte',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 24),
            // Título de Evaluación Financiera
            Text(
              'Evaluación Financiera',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Evaluación',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.blue,
                ),
                SizedBox(width: 4),
                Text('Excellent'),
              ],
            ),
            SizedBox(height: 16),
            // Gráfico y Evaluaciones
            _buildEvaluationSection(
                '7.95', 'COMPORTAMIENTO', Colors.blue, Colors.lightBlue),
            _buildEvaluationSection(
                '18.95', 'SCORE', Colors.red, Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildEvaluationSection(
      String value, String label, Color primaryColor, Color secondaryColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          height: 150,
          child: CustomPaint(
            painter: LineGraphPainter(primaryColor, secondaryColor),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class LineGraphPainter extends CustomPainter {
  final Color primaryColor;
  final Color secondaryColor;

  LineGraphPainter(this.primaryColor, this.secondaryColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paintPrimary = Paint()
      ..color = primaryColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final paintSecondary = Paint()
      ..color = secondaryColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final pathPrimary = Path();
    final pathSecondary = Path();

    // Dibujar la primera línea
    pathPrimary.moveTo(0, size.height * 0.8);
    pathPrimary.lineTo(size.width * 0.2, size.height * 0.6);
    pathPrimary.lineTo(size.width * 0.4, size.height * 0.7);
    pathPrimary.lineTo(size.width * 0.6, size.height * 0.5);
    pathPrimary.lineTo(size.width * 0.8, size.height * 0.3);
    pathPrimary.lineTo(size.width, size.height * 0.4);

    // Dibujar la segunda línea
    pathSecondary.moveTo(0, size.height * 0.7);
    pathSecondary.lineTo(size.width * 0.2, size.height * 0.5);
    pathSecondary.lineTo(size.width * 0.4, size.height * 0.6);
    pathSecondary.lineTo(size.width * 0.6, size.height * 0.4);
    pathSecondary.lineTo(size.width * 0.8, size.height * 0.2);
    pathSecondary.lineTo(size.width, size.height * 0.3);

    // Dibujar los caminos
    canvas.drawPath(pathPrimary, paintPrimary);
    canvas.drawPath(pathSecondary, paintSecondary);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
