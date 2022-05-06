// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'move.dart';
import 'time.dart';

class Menu extends StatelessWidget {
  int move;
  int secondsPassed;

  Menu(this.move, this.secondsPassed);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Move(move),
          Time(secondsPassed),
        ],
      ),
    );
  }
}
