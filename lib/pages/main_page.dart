import 'dart:developer';

import 'package:ava_milk_prod/pages/home_page.dart';
import 'package:ava_milk_prod/utils/constants.dart';
import 'package:flutter/material.dart';

import '../components/inputs/inputs_label.dart';
import '../components/nav_bar.dart';
import '../components/nav_buttons/nav_buttons.dart';

class MainPage extends StatefulWidget {
  final String title;
  final List<Map<String, StatefulWidget>> configs;

  const MainPage({super.key, required this.title, required this.configs});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var controller = TextEditingController();
  late int id;
  var title;
  var config;

  @override
  void initState() {
    id = int.parse(widget.title.split(":")[1]);
    title = widget.title.split(":")[0];
    config = widget.configs[id];
    log("Test");
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
                  title: widget.runtimeType.toString(),
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
                          children: config.keys.map<InputsLabel>((String e) => InputsLabel(title: e)).toList(),
                          // InputsLabel(title: "Nb de louches"),
                          // InputsLabel(title: "Lot"),
                          // InputsLabel(title: "Omega"),
                          // InputsLabel(title: "Sigma"),
                          // InputsLabel(title: "Temp (°C)"),
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
                        title: "Suivant",
                        event: () {
                          log((id + 1).toString());
                          log(widget.configs.length.toString());
                          // DatabaseConnection.sendData()
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
                                builder: (context) => MainPage(title: title + ":" + (id + 1).toString(), configs: widget.configs),
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
