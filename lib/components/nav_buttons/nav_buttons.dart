import 'package:flutter/material.dart';

class NavButtons extends StatefulWidget {
  final String title;
  final Function event;
  final bool active;

  const NavButtons({super.key, required this.title, required this.event, this.active = false});

  @override
  State<NavButtons> createState() => _NavButtonsState();
}

class _NavButtonsState extends State<NavButtons> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        widget.active ? widget.event() : Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.active ? const Color(0xFFEB2831) : Colors.black.withOpacity(0.40),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(vertical: height / 70, horizontal: width / 30),
        child: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 27,
          ),
        ),
      ),
    );
  }
}
