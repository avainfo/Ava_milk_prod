import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class SelectorButton extends StatefulWidget {
  final String title;

  const SelectorButton({super.key, required this.title});

  @override
  State<SelectorButton> createState() => _SelectorButtonState();
}

class _SelectorButtonState extends State<SelectorButton> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      // margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height / 40),
      height: height / 15,
      width: width / 12,
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              active = !active;
            });
          },
          child: Container(
            width: width / 12,
            decoration: BoxDecoration(
              color: active ? Constants.red : Colors.black.withOpacity(0.40),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
