import 'package:diva/core/widgets/auth_methods_app_bar.dart';
import 'package:diva/features/verification/ui/widgets/verification_screen_body.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setupAuthMethodsAppBar('Verification Code'),
      body: const VerificationScreenBody(),
    );
  }
}
