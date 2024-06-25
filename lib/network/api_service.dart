import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Private constructor
  ApiService._internal();

  // Static variable to hold the single instance
  static final ApiService _instance = ApiService._internal();

  // Factory constructor that returns the same instance
  factory ApiService() {
    return _instance;
  }

  Future<Map<String, dynamic>> get(String url) async {
    final response = await http.get(Uri.parse(url));

    return _processResponse(response);
  }

  Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    return _processResponse(response);
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    final statusCode = response.statusCode;
    final body = response.body;

    if (statusCode >= 200 && statusCode < 300) {
      return jsonDecode(body) as Map<String, dynamic>;
    } else {
      throw Exception('Error: $statusCode\nMessage: $body');
    }
  }
}
