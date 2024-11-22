import 'package:ava_milk_prod/components/inputs/incrementer.dart';
import 'package:ava_milk_prod/components/inputs/inputs_label.dart';
import 'package:ava_milk_prod/components/inputs/text_input.dart';
import 'package:ava_milk_prod/components/nav_bar.dart';
import 'package:ava_milk_prod/components/nav_buttons/nav_buttons.dart';
import 'package:ava_milk_prod/utils/constants.dart';
import 'package:flutter/material.dart';

class Seeding extends StatefulWidget {
  const Seeding({super.key});

  @override
  State<Seeding> createState() => _SeedingState();
}

class _SeedingState extends State<Seeding> {
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
