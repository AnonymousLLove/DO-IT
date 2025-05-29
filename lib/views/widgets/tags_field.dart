import 'package:do_it/views/widgets/custom_tag.dart';
import 'package:flutter/material.dart';

/// A simple model to hold a tag’s text + color.
class Tag {
  final String label;
  final Color color;
  Tag(this.label, this.color);
}

/// Your existing CustomTag & _ChevronClipper:
class CustomTag extends StatelessWidget {
  final String label;
  final Color color;
  const CustomTag({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ChevronClipper(),
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        color: color,
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
