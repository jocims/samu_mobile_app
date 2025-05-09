import 'package:flutter/material.dart';
import 'package:samu_mobile_app/services/startup_service.dart';
import 'package:samu_mobile_app/features/authentication/screens/login/login.dart';
import 'package:samu_mobile_app/features/authentication/screens/config_ambulance_screen.dart';
import 'package:samu_mobile_app/features/authentication/screens/dashboard.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initialRoute = await StartupService.getInitialRoute();

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/config-ambulance': (context) => const ConfigAmbulanceScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
