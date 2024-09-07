import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEEE),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("assets/logo.png"),
                  height: MediaQuery.of(context).size.height / 8,
                ),
                IconButton(
                  onPressed: () => {
                    setState(() {
                      darkMode = !darkMode;
                    })
                  },
                  icon: Icon(
                    darkMode
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    size: MediaQuery.of(context).size.height / 15,
                    weight: 1,
                  ),
                ),
              ],
            ),
          ),
  }
}
