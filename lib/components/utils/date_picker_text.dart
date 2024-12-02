import 'package:ava_milk_prod/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerText extends StatefulWidget {
  final Function changeDateEvent;

  const DatePickerText({super.key, required this.changeDateEvent});

  @override
  State<DatePickerText> createState() => _DatePickerTextState();
}

class _DatePickerTextState extends State<DatePickerText> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _openDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Constants.red,
              onPrimary: Colors.white,
              onSurface: Constants.red,
            ),
            dialogBackgroundColor: Constants.darkMode ? CupertinoColors.darkBackgroundGray : Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        widget.changeDateEvent(pickedDate);
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
