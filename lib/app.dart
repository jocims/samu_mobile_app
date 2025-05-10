import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samu_mobile_app/features/authentication/screens/login/login.dart';
import 'package:samu_mobile_app/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: LoginScreen(),
    );
  }
}
