import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/theming/styles.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:diva/features/login/ui/email_and_password.dart';
import 'package:diva/features/login/ui/widgets/dont_have_an_account.dart';
import 'package:diva/features/login/ui/widgets/forget_password_burron.dart';
import 'package:diva/features/login/ui/widgets/methods_to_login.dart';
import 'package:diva/features/login/ui/widgets/or_line.dart';
import 'package:diva/features/login/ui/widgets/remember_me_checkbox.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/tablet.png',
            ),
            verticalSpace(19),
            const EmailAndPassword(),
            verticalSpace(8),
            const ForgetPasswordText(),
            const RememberMeCheckbox(),
            verticalSpace(16),
            AppTextButton(
              buttonText: 'Sign in',
              onPressed: () {
              context.pushReplacementNamed(Routes.homeScreen);

              },
              borderRadius: 30,
              textStyle: TextStyles.font14RobotoRegular.copyWith(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            verticalSpace(24),
            const OrLine(),
            verticalSpace(24),
            const MethodsToLogin(),
            verticalSpace(26),
            const DontHaveAccountText(),
          ],
        ),
      ),
    );
  }
}
