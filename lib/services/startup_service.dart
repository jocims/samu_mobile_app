import 'package:shared_preferences/shared_preferences.dart';

class StartupService {
  static Future<String> getInitialRoute() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    final ambulanceId = prefs.getString('selected_ambulancia_id');

    if (token == null) return '/login';
    if (ambulanceId == null) return '/config-ambulance';
    return '/dashboard';
  }
}
