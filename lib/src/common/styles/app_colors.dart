import 'package:flutter/material.dart';

sealed class AppColors {
  const AppColors._();

  static const Color mainColor = Color(0xFFFCE000);

  static const Color black = Color(0xFF131317);

  static const Color white = Color(0xFFFFFFFF);

  static const Color grey30 = Color.fromARGB(70, 245, 244, 242);

  static const Color grey = Colors.grey;

  static Color? grey100 = Colors.grey[200];
}
