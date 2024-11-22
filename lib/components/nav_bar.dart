import 'package:ava_milk_prod/utils/constants.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.title,
    required this.width,
    required this.height,
    required this.event,
  });

  final String title;
  final double width;
  final double height;
  final Function() event;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 15 * 14,
      height: height / 10,
      margin: EdgeInsets.only(left: width / 15 / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage("assets/logo.png"),
            height: MediaQuery.of(context).size.height / 8,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              color: Color(0xFF6E6E6E),
            ),
          ),
          IconButton(
            onPressed: () => event,
            icon: Icon(
              Constants.darkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
              size: height / 15,
              weight: 1,
              color: Color(0xFF6E6E6E),
            ),
          ),
        ],
      ),
    );
  }
}
