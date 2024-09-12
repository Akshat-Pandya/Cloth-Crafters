// lib/services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';

Future<String?> loginUser(String email, String password) async {
  final url = Uri.parse('$apiUrl/login');
  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['token'];
    } else {
      print('Login failed: ${response.body}');
      return null;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  }
}


