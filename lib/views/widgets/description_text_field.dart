import 'package:do_it/config/constants.dart';
import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 4,
      style: TextStyle(
          fontFamily: font,
          color: const Color.fromRGBO(100, 100, 100, 1),
          fontSize: 12,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromRGBO(177, 176, 176, 1), width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromRGBO(177, 176, 176, 1), width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
