import 'package:app_shoes_ecommerce/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const AuthButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(335, 54),
            backgroundColor: AppPallete.primaryColor,
            shadowColor: AppPallete.backgroundColor),
        child: Text(
          text,
          style: const TextStyle(
              color: AppPallete.whiteColor,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ));
  }
}
