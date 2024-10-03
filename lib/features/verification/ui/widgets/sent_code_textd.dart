import 'package:diva/core/theming/colors.dart';
import 'package:diva/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SentCodeText extends StatelessWidget {
  const SentCodeText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'The Code will be sent to',
            style: TextStyles.font14RobotoRegular.copyWith(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          TextSpan(
            text: ' +234 812 345 6789',
            style: TextStyles.font14RobotoRegular.copyWith(
              color: AppColors.mainColor,
            ),
          )
        ],
      ),
    );
  }
}
