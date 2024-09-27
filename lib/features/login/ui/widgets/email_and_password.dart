import 'package:diva/core/helpers/app_regex.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;
  bool isObscureText = true;
  // late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    // passwordController = context.read<LoginCubit>().passwordController;
    // setUpPasswordListener();
  }

  @override
  void dispose() {
    super.dispose();
    // passwordController.dispose();
  }

  // void setUpPasswordListener() {
  //   passwordController.addListener(() {
  //     final password = passwordController.text;
  //     setState(() {
  //       hasLowerCase = AppRegex.hasLowerCase(password);
  //       hasUpperCase = AppRegex.hasUpperCase(password);
  //       hasSpecialCharacters = AppRegex.hasSpecialCharacter(password);
  //       hasNumber = AppRegex.hasNumber(password);
  //       hasMinLength = AppRegex.hasMinLength(password);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            // controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Password',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            // controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
          ),
        ],
      ),
    );
  }
}
