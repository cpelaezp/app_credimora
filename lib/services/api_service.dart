import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl =
      'https://j9dfz5g326.execute-api.us-east-1.amazonaws.com/dev/datos';

  static Future<List<dynamic>> fetchDatos() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar datos');
    }
  }
}
