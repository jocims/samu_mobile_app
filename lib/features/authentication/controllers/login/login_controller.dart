import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  static Future<(bool, String)> loginUser(String email, String password) async {
    final url = Uri.parse('http://10.0.2.2:5000/auth/api/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'senha': password}),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final token = responseData['token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);
        return (true, 'Login realizado com sucesso!');
      } else {
        return (
          false,
          (responseData['error'] ?? 'Erro ao fazer login').toString(),
        );
      }
    } catch (_) {
      return (false, 'Erro na comunicação com o servidor');
    }
  }
}
