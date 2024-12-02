import 'dart:developer';

import 'package:ava_milk_prod/components/inputs/selector.dart';
import 'package:ava_milk_prod/pages/home_page.dart';
import 'package:ava_milk_prod/utils/constants.dart';
import 'package:flutter/material.dart';

import '../components/buttons/nav_buttons/nav_buttons.dart';
import '../components/inputs/inputs_label.dart';
import '../components/nav_bar.dart';

class MainPage extends StatefulWidget {
  final String title;
  final List<Map<String, StatefulWidget>> configs;
  final DateTime selectedDate;

  const MainPage({super.key, required this.title, required this.configs, required this.selectedDate});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var controller = TextEditingController();
  late int id;
  late String title;
  late Map<String, StatefulWidget> config;
  late DateTime selectedDate;

  @override
  void initState() {
    id = int.parse(widget.title.split(":")[1]);
    title = widget.title.split(":")[0];
    config = widget.configs[id];
    selectedDate = widget.selectedDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var safePadding = MediaQuery.of(context).padding.top;
    var width = size.width;
    var height = size.height - safePadding;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavBar(
                  title: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Color(0xFF6E6E6E),
                    ),
                  ),
                  width: width,
                  height: height,
                  event: () {
                    setState(() {
                      Constants.darkMode = !Constants.darkMode;
                    });
                  },
                ),
                SizedBox(
                  width: width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: config.keys.expand<Widget>((String e) {
                            if (config[e] is Selector) {
                              var widgetHeight = (height / 15 + 20) * 4 + height / 20;
                              return [
                                InputsLabel(title: e),
                                SizedBox(
                                  height: (widgetHeight - (height / 15) - height / 20),
                                ),
                              ];
                            } else {
                              return [
                                InputsLabel(title: e),
                              ];
                            }
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        width: width / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: config.values.toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width / 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      NavButtons(title: "Précédent", event: () => Navigator.pop(context)),
                      NavButtons(
                        title: widget.configs.length == (id + 1) ? "Terminer" : "Suivant",
                        event: () {
                          log((id + 1).toString());
                          log(widget.configs.length.toString());
                          // TODO : DatabaseConnection.sendData()
                          if (widget.configs.length == (id + 1)) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                              (Route<dynamic> route) => false,
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(
                                  title: "$title:${id + 1}",
                                  configs: widget.configs,
                                  selectedDate: selectedDate,
                                ),
                              ),
                            );
                          }
                        },
                        active: true,
                      ),
                    ],
                  ),
                ),
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
