import 'package:do_it/config/constants.dart';
import 'package:do_it/controllers/biometrics.dart';
import 'package:do_it/controllers/create_account_controller.dart';
import 'package:do_it/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final controller = CreateAccountController();
  bool showPassword = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
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
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, size: 20),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                
                    SizedBox(height: screenHeight * 0.1),
                
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
                                text: 'DO-',
                                style: TextStyle(
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                  fontFamily: font,
                                ),
                              ),
                              TextSpan(
                                text: 'IT',
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
                    SizedBox(height: screenHeight * 0.02),
                    Center(
                      child: Text(
                        'Welcome Back !',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: font,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextField(
                            "Email",
                            controller.emailController,
                            Icons.email,
                            isEmail: true,
                          ),
                          _buildTextField(
                            "Password",
                            controller.passwordController,
                            Icons.lock,
                            isPassword: true,
                          ),
                        ],
                      ),
                    ),
                
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(129, 129, 129, 1),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.08),
                   ],
                ),
              ),
                Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              Navigator.pushNamed(context, AppRoutes.dashboard);
                            }
                          },
                          child: Container(
                            width:
                                screenWidth *
                                0.65, // makes container fill parent width
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ), // vertical padding for height
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(
                                10,
                              ), // rounded edges
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors
                                    .white, // assuming you want white text on colored bg
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.04),
                        GestureDetector(
                          onTap:(){authenticate(context);},
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              border: Border.all(
                                color: color, // border color
                                // border thickness
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Image.asset("assets/images/fingerprint.png"),
                          ),
                        ),
                      ],
                    ),
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(129, 129, 129, 1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {Navigator.pushNamed(context, AppRoutes.signup);},
                
                          child: Text(
                            "Create Account",
                            style: TextStyle(fontSize: 14, color: color),
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

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    IconData icon, {
    bool isPassword = false,
    bool isEmail = false,
  }) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height * 0.03),
      child: Theme(
        data: Theme.of(context).copyWith(
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: TextStyle(color: color), // Focused label color
            labelStyle: TextStyle(
              fontFamily: font,
              color: Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
        ),
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$label cannot be empty ';
            }
            if (isEmail &&
                !RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(value)) {
              return "Enter Valid Email";
            }

            if (isPassword) {
              if (value.length < 9) {
                return 'Password must be at least 9 characters long';
              }
              if (!RegExp(r'[a-z]').hasMatch(value)) {
                return 'Password must contain at least one lowercase letter';
              }
              if (!RegExp(r'[A-Z]').hasMatch(value)) {
                return 'Password must contain at least one uppercase letter';
              }
              if (!RegExp(r'\d').hasMatch(value)) {
                return 'Password must contain at least one number';
              }
              if (!RegExp(r'[!@#$%^&*(),.":{}|<>]').hasMatch(value)) {
                return 'Password must contain at least one special character';
              }
              if (value.contains(' ')) {
                return 'Password must not contain spaces';
              }
            }

            return null;
          },

          style: TextStyle(
            color: Color.fromRGBO(100, 100, 100, 1),
            fontSize: 16,
          ),
          obscureText: isPassword && !showPassword,
          decoration: InputDecoration(
            labelText: label,

            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  )
                : null,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 19.0,
              horizontal: 16.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color.fromRGBO(100, 100, 100, 1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color.fromRGBO(100, 100, 100, 1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: color),
            ),
          ),
        ),
      ),
    );
  }
}
