import 'package:do_it/config/constants.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final int maxLines;
  final void Function(String) onChanged;

  const TextInputField({super.key, 
    required this.label,
    this.maxLines = 1,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext c) {
    return TextField(
      onChanged: onChanged,
      maxLines: maxLines,
       style:  TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w900,
    fontFamily:font, 
  ),
      decoration: const InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(177, 176, 176, 1)), 
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(177, 176, 176, 1)),
    ),

    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(177, 176, 176, 1)),
    ),
  ),

    );
  }
}
