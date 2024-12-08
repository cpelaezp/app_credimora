import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentsScreen(),
    );
  }
}

class PaymentsScreen extends StatelessWidget {
  // Datos de ejemplo para pagos realizados y futuros
  final List<Map<String, String>> completedPayments = [
    {"date": "2024-01-10", "amount": "\$200"},
    {"date": "2023-12-10", "amount": "\$200"},
    {"date": "2023-11-10", "amount": "\$200"},
  ];

  final List<Map<String, String>> futurePayments = [
    {"date": "2024-03-10", "amount": "\$200"},
    {"date": "2024-04-10", "amount": "\$200"},
    {"date": "2024-05-10", "amount": "\$200"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial de Pagos"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Próxima cuota a pagar
            Text(
              "Próxima cuota a pagar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Monto: \$200",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Fecha: 2024-02-10",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Estado: Pendiente",
                        style: TextStyle(fontSize: 14, color: Colors.orange),
                      ),
                    ],
                  ),
                  Icon(Icons.payment, size: 40, color: Colors.blue),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Lista de pagos realizados
            Text(
              "Pagos realizados",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: completedPayments.length,
                itemBuilder: (context, index) {
                  final payment = completedPayments[index];
                  return ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text("Fecha: ${payment['date']}"),
                    subtitle: Text("Monto: ${payment['amount']}"),
                  );
                },
              ),
            ),
            // Lista de pagos futuros
            Text(
              "Pagos futuros",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: futurePayments.length,
                itemBuilder: (context, index) {
                  final payment = futurePayments[index];
                  return ListTile(
                    leading: Icon(Icons.schedule, color: Colors.orange),
                    title: Text("Fecha: ${payment['date']}"),
                    subtitle: Text("Monto: ${payment['amount']}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
