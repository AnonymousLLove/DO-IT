import 'package:do_it/config/constants.dart';
import 'package:do_it/controllers/create_account_controller.dart';
import 'package:do_it/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final controller = CreateAccountController();
  bool showPassword = false;
  late String fullPhoneNumber;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Create\nAccount',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: 'Please fill the details below to\ncreate a ',
                    style: TextStyle(color: Colors.black), // Default text style
                    children: [
                      TextSpan(
                        text: 'DO-IT',
                        style: TextStyle(
                          color: color, // Change to your desired color
                        ),
                      ),
                      TextSpan(text: ' account'),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextField(
                        "Name",
                        controller.nameController,
                        Icons.email,
                        isEmail: true,
                      ),

                      _buildTextField(
                        "Email",
                        controller.emailController,
                        Icons.email,
                        isEmail: true,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.015),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            inputDecorationTheme: InputDecorationTheme(
                              floatingLabelStyle: TextStyle(
                                color: color,
                              ), // Focused label color
                              labelStyle: TextStyle(
                                fontFamily: font,
                                color: Color.fromRGBO(100, 100, 100, 1),
                              ),
                            ),
                          ),
                          child: IntlPhoneField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 19.0,
                                horizontal: 16.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(100, 100, 100, 1),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(100, 100, 100, 1),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: color),
                              ),

                              labelText: "Mobile Number",
                            ),

                            style: TextStyle(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            initialCountryCode: 'NG',
                            validator: (phoneNumber) {
                              if (phoneNumber == null ||
                                  phoneNumber.number.isEmpty) {
                                return 'Mobile Number cannot be empty';
                              }
                              return null;
                            },
                            onChanged: (phone) {
                              fullPhoneNumber = phone.completeNumber;
                            },
                            onCountryChanged: (country) {
                              //  print('Country changed to: ' + country.name);
                            },
                          ),
                        ),
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
                SizedBox(height: screenHeight * 0.06),
                CustomButton(
                  text: 'Create account',
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      controller.createAccount(context);
                    }
                  },
                ),

                Center(
                  child: TextButton(
                    onPressed: () {},

                    child: Text(
                      "Privacy policy",
                      style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromRGBO(196, 196, 196, 1),
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
