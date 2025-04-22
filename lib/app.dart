import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samu_mobile_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:samu_mobile_app/utils/theme/theme.dart';
import 'package:samu_mobile_app/features/authentication/screens/dashboard.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const DashboardScreen(),
    );
  }
}
