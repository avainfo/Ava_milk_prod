import 'package:ava_milk_prod/components/main_button.dart';
import 'package:ava_milk_prod/components/nav_bar.dart';
import 'package:ava_milk_prod/pages/seeding.dart';
import 'package:ava_milk_prod/pages/washing.dart';
import 'package:ava_milk_prod/utils/constants.dart';
import 'package:flutter/material.dart';

import 'freezing.dart';
import 'manufacturing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, Widget> pages = {
    "Ensemencement": Seeding(),
    "Fabrication": Manufacturing(),
    "Congélation": Freezing(),
    "Lavage": Washing(),
  };

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var safePadding = MediaQuery.of(context).padding.top;
    var width = size.width;
    var height = size.height - safePadding;

    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NavBar(
                title: "",
                width: width,
                height: height,
                event: () {
                  setState(() {
                    Constants.darkMode = !Constants.darkMode;
                  });
                },
              ),
              SizedBox(
                width: width / 5 * 4,
                height: height - height / 10 * 2,
                child: Wrap(
                  alignment: WrapAlignment.spaceAround,
                  runAlignment: WrapAlignment.spaceAround,
                  children: pages.entries.map((entry) {
                    return MainButton(title: entry.key, route: entry.value);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
