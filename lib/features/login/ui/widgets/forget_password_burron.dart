import 'package:diva/core/theming/styles.dart';
import 'package:flutter/material.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Text(
        'Forget Password?',
        style: TextStyles.font14RobotoRegular,
      ),
    );
  }
}
