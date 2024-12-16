import 'dart:developer';

import 'package:ava_milk_prod/components/buttons/selector_button.dart';
import 'package:flutter/material.dart';

class Selector extends StatefulWidget {
  final List<String> buttons;
  final Function(List<String>)? onValueChanged;

  const Selector({super.key, required this.buttons, this.onValueChanged});

  @override
  State<Selector> createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  List<String> selectedButtons = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int i = 0;

    var widgetHeight = (height / 15 + 20) * (widget.buttons.length ~/ 2);
    return SizedBox(
      width: width / 4,
      // height: widgetHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: width / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: height / 40),
                  width: width / 12,
                  height: widgetHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: widget.buttons
                        .map((e) {
                          if (i < widget.buttons.length / 2) {
                            i++;
                            return SelectorButton(title: widget.buttons[i - 1], onValueChanged: (title) {
                              selectedButtons.add(title);
                              log(title);
                              widget.onValueChanged!(selectedButtons);
                            });
                          }
                          return null;
                        })
                        .whereType<Widget>()
                        .toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: height / 40),
                  width: width / 12,
                  height: widgetHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: widget.buttons
                        .map((e) {
                          if (i < widget.buttons.length) {
                            i++;
                            return SelectorButton(title: widget.buttons[i - 1], onValueChanged: (title) {
                              selectedButtons.add(title);
                              log(title);
                              widget.onValueChanged!(selectedButtons);
                            });
                          }
                          return null;
                        })
                        .whereType<Widget>()
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
