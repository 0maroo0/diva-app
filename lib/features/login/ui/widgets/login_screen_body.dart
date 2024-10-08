import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/theming/styles.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:diva/core/widgets/loading_indicator.dart';
import 'package:diva/features/login/logic/cubit/login_cubit.dart';
import 'package:diva/features/login/logic/cubit/login_state.dart';
import 'package:diva/features/login/ui/widgets/email_and_password.dart';
import 'package:diva/features/login/ui/widgets/dont_have_an_account.dart';
import 'package:diva/features/login/ui/widgets/forget_password_burron.dart';
import 'package:diva/core/widgets/auth_methods.dart';
import 'package:diva/core/widgets/or_line.dart';
import 'package:diva/features/login/ui/widgets/remember_me_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              loadingIndicator(context);
            } else if (state is LoginSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Login Successful!',
                  ),
                ),
              );
              context.pushReplacementNamed(Routes.homeScreen);
            } else if (state is LoginFailure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
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
                verticalPadding: 0,
                onPressed: () {
                  if (context
                      .read<LoginCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<LoginCubit>().login();
                  }
                },
                borderRadius: 30,
                textStyle: TextStyles.font18RobotoRegular,
              ),
              verticalSpace(24),
              const OrLine(),
              verticalSpace(24),
              const AuthMethods(),
              verticalSpace(26),
              const DontHaveAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
