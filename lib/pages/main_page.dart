import 'package:flutter/material.dart';

import '../components/inputs/incrementer.dart';
import '../components/inputs/text_input.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var safePadding = MediaQuery.of(context).padding.top;
    var width = size.width;
    var height = size.height - safePadding;

    var config = {
      "Nb louches": const Incrementer(),
      "Lot": const TextInput(),
      "Omega": const Incrementer(),
      "Sigma": const Incrementer(),
      "Temp (°C)": const Incrementer(),
    };

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                          children: config.keys.map((e) => InputsLabel(title: e)).toList(),
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
                      NavButtons(title: "Suivant", event: () => Navigator.pop(context), active: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
