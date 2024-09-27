import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/theming/styles.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:diva/core/widgets/auth_methods.dart';
import 'package:diva/core/widgets/or_line.dart';
import 'package:diva/features/sign_up/ui/widgets/already_have_account_text.dart';
import 'package:diva/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/sign_up.png'),
            const SignUpForm(),
            AppTextButton(
              verticalPadding: 0,
              buttonText: 'Sign Up',
              textStyle: TextStyles.font18RobotoRegular,
              onPressed: () {},
              borderRadius: 30,
            ),
            verticalSpace(24),
            const OrLine(),
            verticalSpace(24),
            const AuthMethods(),
            verticalSpace(24),
            const AlreadyHaveAccountText(),
          ],
        ),
      ),
    );
  }
}
