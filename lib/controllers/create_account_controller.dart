import 'package:do_it/routes/app_routes.dart';

import '../models/user_model.dart';
import 'package:flutter/material.dart';

class CreateAccountController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  UserModel get user => UserModel(
    name: nameController.text,
    email: emailController.text,
    mobileNumber: mobileController.text,
    password: passwordController.text,
  );

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
  }

  void createAccount(BuildContext context) {
   Navigator.pushNamed(context, AppRoutes.dashboard);
  }
}
