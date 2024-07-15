import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final bool isObscureText;
  final Widget? sufixIcon;
  final TextEditingController controller;

  const AuthField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isObscureText = false,
      this.sufixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      obscuringCharacter: "•",
      decoration: InputDecoration(hintText: hintText, suffixIcon: sufixIcon),
    );
  }
}
