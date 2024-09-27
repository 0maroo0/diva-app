import 'package:diva/core/widgets/auth_methods_app_bar.dart';
import 'package:diva/features/sign_up/ui/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authMethodsAppBar('Sign Up'),
      body: const SignUpScreenBody(),
    );
  }
}
