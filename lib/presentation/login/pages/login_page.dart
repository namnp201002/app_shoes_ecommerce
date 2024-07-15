import 'package:app_shoes_ecommerce/core/theme/app_pallete.dart';
import 'package:app_shoes_ecommerce/core/theme/bloc/theme_bloc.dart';
import 'package:app_shoes_ecommerce/core/theme/theme_data.dart';
import 'package:app_shoes_ecommerce/presentation/login/pages/signup_page.dart';
import 'package:app_shoes_ecommerce/presentation/login/widget/auth_button.dart';
import 'package:app_shoes_ecommerce/presentation/login/widget/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hello Again",
                style: TextStyle(
                    fontSize: 35,
                    color: AppPallete.textColor,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Welcome Back You've Been Missed!",
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
                sufixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_off),
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Recover Password",
                    style: TextStyle(
                        fontSize: 15, color: AppPallete.textGrayColor1),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              AuthButton(
                text: 'Sign In',
                onPressed: () {
                  final themeBloc = BlocProvider.of<ThemeBloc>(context);
                  final isDarkTheme = themeBloc.themeData == AppTheme.darkTheme;
                  themeBloc.add(ThemeChanged(
                      theme: isDarkTheme
                          ? AppTheme.lightTheme
                          : AppTheme.darkTheme));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignUpPage.route());
                },
                child: RichText(
                  text: TextSpan(
                      text: "Don't you have account? ",
                      children: const [
                        TextSpan(
                            text: 'Sign Up For Free',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppPallete.textColor))
                      ],
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppPallete.textGrayColor1)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
