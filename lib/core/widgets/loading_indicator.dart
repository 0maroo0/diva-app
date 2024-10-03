import 'package:diva/core/theming/colors.dart';
import 'package:flutter/material.dart';
  Future<dynamic> loadingIndicator(BuildContext context) {
    return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.mainColor,
            ),
          ),
        );
  }