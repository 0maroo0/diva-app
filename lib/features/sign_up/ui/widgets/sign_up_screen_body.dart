import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/routing/routes.dart';
import 'package:diva/core/theming/styles.dart';
import 'package:diva/core/widgets/app_text_button.dart';
import 'package:diva/core/widgets/auth_methods.dart';
import 'package:diva/core/widgets/loading_indicator.dart';
import 'package:diva/core/widgets/or_line.dart';
import 'package:diva/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:diva/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:diva/features/sign_up/ui/widgets/already_have_account_text.dart';
import 'package:diva/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoadingEmail || state is SignUpLoadingPhone) {
          loadingIndicator(context);
        } else if (state is SignUpSuccessEmail) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Sign Up Successful!',
              ),
            ),
          );
          context.pushReplacementNamed(Routes.loginScreen);
        } else if (state is SignUpFailureEmail) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        } else if (state is SignUpSuccessPhone) {
          Navigator.pop(context);
          context.pushReplacementNamed(Routes.verificationScreen);
        } else if (state is SignUpFailurePhone) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      child: Padding(
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
                onPressed: () {
                  if (context
                      .read<SignUpCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<SignUpCubit>().signUp();
                  }
                },
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
      ),
    );
  }
}
