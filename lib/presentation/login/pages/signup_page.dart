import 'package:app_shoes_ecommerce/core/theme/app_pallete.dart';
import 'package:app_shoes_ecommerce/presentation/login/widget/auth_button.dart';
import 'package:app_shoes_ecommerce/presentation/login/widget/auth_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpPage());
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create Account",
                style: TextStyle(
                    fontSize: 35,
                    color: AppPallete.textColor,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Let's Create Account Together",
                style: TextStyle(
                  fontSize: 20,
                  color: AppPallete.textGrayColor1,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Name",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppPallete.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              AuthField(
                hintText: 'Your Name',
                controller: name,
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email Address",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppPallete.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              AuthField(
                hintText: 'Email',
                controller: email,
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppPallete.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              AuthField(
                hintText: 'Password',
                controller: password,
                isObscureText: true,
                sufixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const AuthButton(text: 'Sign Up'),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                    text: "Do you have account? ",
                    children: const [
                      TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppPallete.textColor))
                    ],
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppPallete.textGrayColor1)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
