import 'package:diva/core/theming/colors.dart';
import 'package:diva/core/theming/styles.dart';
import 'package:flutter/material.dart';

class RememberMeCheckbox extends StatefulWidget {
  const RememberMeCheckbox({super.key});

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  var checked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          side: BorderSide(
            color: Colors.black.withOpacity(0.8),
          ),
          value: checked,
          checkColor: Colors.white,
          fillColor: WidgetStateProperty.all(
            checked ? AppColors.mainColor : Colors.transparent,
          ),
          onChanged: (value) {
            setState(() {
              checked = value!;
            });
          },
        ),
        Text(
          'Remember me.',
          style: TextStyles.font13RobotoRegular.copyWith(
            fontSize: 14,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
