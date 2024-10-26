import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiServices {
  // URL API
  final String loginUrl = 'http://localhost:3000/users/login';
  final String registerUrl = 'http://localhost:3000/users/register';

  // Fungsi untuk melakukan Login
  Future<Map<String, dynamic>> loginUser(User user) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal melakukan Login!');
    }
  }

  // Fungsi untuk melakukan Register
  Future<Map<String, dynamic>> registerUser(User user) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal melakukan Register!');
    }
  }
}
