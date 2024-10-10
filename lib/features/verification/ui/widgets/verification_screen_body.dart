import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/features/verification/ui/widgets/sent_code_textd.dart';
import 'package:diva/features/verification/ui/widgets/verification_form.dart';
import 'package:flutter/material.dart';

class VerificationScreenBody extends StatelessWidget {
  const VerificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/verification.png'),
        verticalSpace(4),
        const SentCodeText(),
        verticalSpace(18),
        const VerificationForm(),
      ],
    );
  }
}
