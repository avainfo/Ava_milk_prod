import 'package:ava_milk_prod/components/inputs/incrementer_button.dart';
import 'package:flutter/material.dart';

class Incrementer extends StatefulWidget {
  const Incrementer({
    super.key,
  });

  @override
  State<Incrementer> createState() => _IncrementerState();
}

class _IncrementerState extends State<Incrementer> {
  var controller = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height / 40),
      height: height / 15,
      width: width / 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: const Border.fromBorderSide(
                BorderSide(
                  color: Color(0xFFEB2831),
                  width: 2,
                ),
              ),
            ),
            width: width / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IncrementerButton(
                  controller: controller,
                  icon: Icons.remove,
                  value: -1,
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                IncrementerButton(
                  controller: controller,
                  icon: Icons.add,
                  value: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
