import 'dart:convert';
import 'package:http/http.dart' as http;

// This service is ready for Django REST Framework.
// Android emulator uses 10.0.2.2 to reach localhost on your computer.
class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getExpenses() async {
    final response = await http.get(Uri.parse('$baseUrl/expenses/'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    }
    throw Exception('Could not load expenses');
  }

  Future<Map<String, dynamic>> askAssistant(String message) async {
    final response = await http.post(
      Uri.parse('$baseUrl/ai-assistant/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
    throw Exception('AI assistant placeholder failed');
  }

  Future<Map<String, dynamic>> scanReceiptPlaceholder() async {
    final response = await http.post(Uri.parse('$baseUrl/receipt-scan/'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    }
    throw Exception('Receipt scan placeholder failed');
  }
}
