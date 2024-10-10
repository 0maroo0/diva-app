import 'package:diva/core/widgets/auth_methods_app_bar.dart';
import 'package:diva/features/login/ui/widgets/login_screen_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setupAuthMethodsAppBar('Welcome Back!'),
      body: const LoginScreenBody(),
    );
  }
}
