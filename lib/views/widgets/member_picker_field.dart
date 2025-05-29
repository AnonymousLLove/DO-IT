import 'package:flutter/material.dart';

class MemberPickerField extends StatelessWidget {
  final String label;
  final void Function(String) onMemberAdded;

  const MemberPickerField({required this.label, required this.onMemberAdded});

  @override
  Widget build(BuildContext c) {
    return Row(
      children: [
        Expanded(child: Text(label)),
        IconButton(
          icon: const Icon(Icons.add_circle, color: Colors.blue),
          onPressed: () {
            // e.g. open a dialog to pick a user
            onMemberAdded('someUserId');
          },
        ),
      ],
    );
  }
}
