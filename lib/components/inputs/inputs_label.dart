import 'package:flutter/material.dart';

class InputsLabel extends StatelessWidget {
  const InputsLabel({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: height / 40),
      height: height / 15,
      width: width / 4,
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              color: Color(0xFF6E6E6E),
            ),
          ),
        ],
      ),
    );
  }
}
