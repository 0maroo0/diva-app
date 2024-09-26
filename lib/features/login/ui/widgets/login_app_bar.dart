import 'package:diva/core/theming/styles.dart';
import 'package:flutter/material.dart';

AppBar loginAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      'Welcome Back!',
      style: TextStyles.font18LibreRegular,
    ),
  );
}
