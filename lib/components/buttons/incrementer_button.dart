import 'package:flutter/material.dart';

class IncrementerButton extends StatelessWidget {
  const IncrementerButton({
    super.key,
    required this.controller,
    required this.icon,
    required this.value,
  });

  final TextEditingController controller;
  final IconData icon;
  final int value;

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
              backgroundColor: const WidgetStatePropertyAll(Color(0xFFEB2831)),
            ),
            color: Colors.white,
            onPressed: () {
              controller.text = (int.parse(controller.text) + value).toString();
            },
            icon: Icon(icon),
          );
        },
      ),
    );
  }
}
