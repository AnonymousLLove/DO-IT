import 'package:do_it/config/constants.dart';
import 'package:flutter/material.dart';
import '../../controllers/welcome_controller.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WelcomeController(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit
                          .contain, // Adjusts the image to fit inside the container
                    ),
                  ),
                  SizedBox(width: 20),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'DO',
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                            color: color,
                            fontFamily: font,
                          ),
                        ),
                        TextSpan(
                          text: '-IT',
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                            color: color,
                            decoration: TextDecoration.underline,
                            decorationColor: color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisSize: MainAxisSize.min, // Ensure Row wraps its content
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.15,
                      right: screenWidth * 0.18,
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/blue.png', // Replace with your image path
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/check.png',
                            width: 24,
                            height: 24,
                          ),

                          Image.asset(
                            'assets/images/yellow.png',
                            width: 10,
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.15,
                      left: screenWidth * 0.18,
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/calender.png', // Replace with your image path
                          width: 24,
                          height: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                child: Image.asset(
                  'assets/images/write.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: screenHeight * 0.06),
              Text.rich(
                TextSpan(
                  text: 'Just ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: font,
                  ),
                  children: [
                    TextSpan(
                      text: 'DO-IT',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: font,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'Create account',
                onPressed: controller.navigateToSignUp,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(color: Color.fromRGBO(218, 218, 218, 1)),
                  ),
                  TextButton(
                    onPressed: controller.navigateToSignIn,
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: color),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
