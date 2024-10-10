import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/theming/colors.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('One Lower Character', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('One Upper Character', hasUpperCase),
        verticalSpace(2),
        buildValidationRow('One Special Number ', hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow('8  Characteres Minimum', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor:
              hasValidated ? AppColors.trueColor : AppColors.errorColor,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font12MulishRegular.copyWith(
            color: hasValidated ? AppColors.trueColor : AppColors.errorColor,
          ),
        )
      ],
    );
  }
}
