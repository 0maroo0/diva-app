import 'package:diva/core/helpers/app_regex.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/widgets/app_text_form_field.dart';
import 'package:diva/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:diva/features/sign_up/ui/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;
  bool showPasswordRequirements = false;
  final FocusNode passwordFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
    passwordFocusNode.addListener(() {
      setState(() {
        showPasswordRequirements = passwordFocusNode.hasFocus;
      });
    });
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'E-mail / Phone Number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  (!AppRegex.isEmailValid(value) &&
                      !AppRegex.isPhoneNumberValid(value))) {
                return 'Please enter a valid email or phone number';
              }
            },
            controller: context.read<SignUpCubit>().emailOrPhoneController,
          ),
          verticalSpace(16),
          AppTextFormField(
            hintText: 'Password',
            focusNode: passwordFocusNode,
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
            controller: context.read<SignUpCubit>().passwordController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(16),
          Visibility(
            visible: showPasswordRequirements,
            child: PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasMinLength: hasMinLength,
            ),
          ),
          verticalSpace(showPasswordRequirements ? 16 : 0),
          AppTextFormField(
            hintText: 'Confirm Password',
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            controller:
                context.read<SignUpCubit>().passwordConfirmationController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value != passwordController.text) {
                return 'Passwords do not match';
              }
            },
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
