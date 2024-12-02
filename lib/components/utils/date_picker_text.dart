import 'package:ava_milk_prod/utils/constants.dart';
import 'package:flutter/material.dart';

class DatepickerText extends StatefulWidget {
  @override
  State<DatepickerText> createState() => _DatepickerTextState();
}

class _DatepickerTextState extends State<DatepickerText> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _openDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _openDatePicker,
        child: Text(
          '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
          style: TextStyle(fontSize: 24, color: Constants.red),
        ),
      ),
    );
  }
}
