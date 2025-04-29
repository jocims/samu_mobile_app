import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../screens/config_ambulance_screen.dart';

class LoginController {
  static Future<void> loginUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    final url = Uri.parse('http://10.0.2.2:5001/auth/api/login');
    print(
      'Sending login request to $url with email: $email and password: $password',
    );

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'senha': password}),
      );
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login realizado com sucesso!')),
        );
        Get.offAll(() => const ConfigAmbulanceScreen());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseData['error'] ?? 'Erro ao fazer login'),
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro na comunicação com o servidor')),
      );
    }
  }
}
