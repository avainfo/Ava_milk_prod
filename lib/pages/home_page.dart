import 'package:ava_milk_prod/components/buttons/main_button.dart';
import 'package:ava_milk_prod/components/nav_bar.dart';
import 'package:ava_milk_prod/components/utils/date_picker_text.dart';
import 'package:ava_milk_prod/pages/main_page.dart';
import 'package:ava_milk_prod/pages/washing.dart';
import 'package:ava_milk_prod/utils/configurations.dart';
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
  late DateTime date;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
  }

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
                title: DatePickerText(changeDateEvent: (newDate) {
                  setState(() {
                    date = newDate;
                  });
                }),
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
                  children: [
                    MainButton(
                      title: "Ensemencement",
                      route: MainPage(
                        title: "Seeding:0",
                        configs: Configurations.SEEDING_CONFIGURATIONS,
                        selectedDate: date,
                      ),
                    ),
                    MainButton(
                      title: "Fabrication",
                      route: MainPage(
                        title: "Manufacturing:0",
                        configs: Configurations.SEEDING_CONFIGURATIONS,
                        selectedDate: date,
                      ),
                    ),
                    MainButton(
                      title: "Congélation",
                      route: Freezing(),
                    ),
                    MainButton(
                      title: "Lavage",
                      route: Washing(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
