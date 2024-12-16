import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class IncrementerButton extends StatelessWidget {
  const IncrementerButton({
    super.key,
    required this.controller,
    required this.icon,
    required this.value,
    required this.onPressed,
  });

  final TextEditingController controller;
  final IconData icon;
  final int value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 18,
      width: height / 18,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return IconButton(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              backgroundColor: WidgetStatePropertyAll(Constants.red),
            ),
            color: Colors.white,
            onPressed: onPressed,
            icon: Icon(icon),
          );
        },
      ),
    );
  }
}
