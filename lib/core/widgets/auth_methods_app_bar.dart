import 'package:diva/core/theming/styles.dart';
import 'package:flutter/material.dart';

AppBar authMethodsAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: TextStyles.font18LibreRegular.copyWith(
        fontSize: 24,
      ),
    ),
  );
}
