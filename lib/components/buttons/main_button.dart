import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Widget route;

  const MainButton({
    super.key,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => route,
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 25,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 50,
              color: const Color(0xFF6E6E6E),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
