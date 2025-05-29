import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final int maxLines;
  final void Function(String) onChanged;

  const TextInputField({
    required this.label,
    this.maxLines = 1,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext c) {
    return TextField(
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const UnderlineInputBorder(),
      ),
    );
  }
}
