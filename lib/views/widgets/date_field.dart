import 'package:flutter/material.dart';

class DateField extends StatelessWidget {
  final String label;
  final void Function(DateTime) onDateSelected;

  const DateField({required this.label, required this.onDateSelected});

  Future<void> _pickDate(BuildContext context) async {
    final d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (d != null) onDateSelected(d);
  }

  @override
  Widget build(BuildContext c) {
    return InkWell(
      onTap: () => _pickDate(c),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const UnderlineInputBorder(),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        child: const Text(''), // could show selected date if stateful
      ),
    );
  }
}
