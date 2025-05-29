import 'package:do_it/routes/app_routes.dart';
import 'package:flutter/material.dart';

class WelcomeController {
  final BuildContext context;
  WelcomeController(this.context);

  void navigateToSignUp() {
    Navigator.pushNamed(context, AppRoutes.signup);
  }

  void navigateToSignIn() {
    Navigator.pushNamed(context, AppRoutes.signin);
  }
}
