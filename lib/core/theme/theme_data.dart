import 'package:app_shoes_ecommerce/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = AppPallete.whiteColor]) => OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 0.5),
      borderRadius: BorderRadius.circular(10));

  static final lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppPallete.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: _border(),
          fillColor: AppPallete.whiteColor,
          filled: true,
          focusedBorder: _border(Colors.grey[200]!)));

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
  );
}
