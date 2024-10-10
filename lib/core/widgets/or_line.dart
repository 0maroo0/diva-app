import 'package:diva/core/theming/styles.dart';
import 'package:flutter/material.dart';

class OrLine extends StatelessWidget {
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'OR',
              style: TextStyles.font13RobotoRegular.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
