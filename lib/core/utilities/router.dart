import 'package:app_shoes_ecommerce/core/utilities/routes.dart';
import 'package:app_shoes_ecommerce/presentation/login/pages/login_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    default:
      return MaterialPageRoute(builder: (context) => const LoginPage());
  }
}
