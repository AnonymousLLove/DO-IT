import 'package:flutter/material.dart';

class TagsField extends StatelessWidget {
  final String label;
  final void Function(String) onTagAdded;

  const TagsField({required this.label, required this.onTagAdded});

  @override
  Widget build(BuildContext c) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const UnderlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.add, color: Colors.blue),
          onPressed: () => onTagAdded('newTag'),
        ),
      ),
    );
  }
}
