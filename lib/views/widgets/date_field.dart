import 'package:do_it/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
  final void Function(DateTime) onDateSelected;

  const DateField({
    super.key,
    required this.onDateSelected,
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final d = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (d != null) {
      setState(() {
        _selectedDate = d;
      });
      widget.onDateSelected(d);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String displayText =
        _selectedDate != null ? DateFormat.yMMMd().format(_selectedDate!) : "";

    return InkWell(
      onTap: () => _pickDate(context),
      child: InputDecorator(
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
        child: Row(
          children: [
            const Icon(Icons.calendar_today,
                size: 15, color: Color.fromRGBO(100, 100, 100, 1)),
            const SizedBox(width: 10),
            Text(
              displayText,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: font,
                color: const Color.fromRGBO(78, 78, 78, 1),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
