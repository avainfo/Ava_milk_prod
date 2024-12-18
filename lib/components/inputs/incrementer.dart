import 'package:ava_milk_prod/components/buttons/incrementer_button.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class Incrementer extends StatefulWidget {
  final Function(int)? onValueChanged;

  const Incrementer({
    super.key,
    this.onValueChanged,
  });

  @override
  State<Incrementer> createState() => _IncrementerState();
}

class _IncrementerState extends State<Incrementer> {
  var controller = TextEditingController(text: "0");

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final value = int.tryParse(controller.text) ?? 0;
      widget.onValueChanged?.call(value);
    });
  }

  void _updateControllerValue(int delta) {
    final currentValue = int.tryParse(controller.text) ?? 0;
    controller.text = (currentValue + delta).toString();
  }

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
              border: Border.fromBorderSide(
                BorderSide(
                  color: Constants.red,
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
                  onPressed: () => _updateControllerValue(-1), // Diminue la valeur
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
                  onPressed: () => _updateControllerValue(1), // Augmente la valeur
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
