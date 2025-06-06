import 'package:do_it/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DO-IT',
      debugShowCheckedModeBanner: false,
    
      initialRoute: AppRoutes.welcome,
      routes: AppRoutes.routes,
    );
  }
}
