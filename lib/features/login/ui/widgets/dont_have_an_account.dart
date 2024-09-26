import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/core/routing/routes.dart';
import 'package:diva/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account? ',
            style: TextStyles.font14RobotoRegular.copyWith(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyles.font14RobotoRegular.copyWith(
              fontSize: 18,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.signUpScreen);
              },
          ),
        ],
      ),
    );
  }
}
