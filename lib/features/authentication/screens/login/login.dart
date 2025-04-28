import 'package:flutter/material.dart';
import 'package:samu_mobile_app/common/styles/spacing_styles.dart';
import 'package:samu_mobile_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:samu_mobile_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:samu_mobile_app/features/authentication/screens/login/widgets/form_divider.dart';
import 'package:samu_mobile_app/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title and Subtitle
              LoginHeader(dark: dark),

              /// Form
              LoginForm(),

              /// Divider
              FormDivider(dark: dark),
            ],
          ),
        ),
      ),
    );
  }
}
