// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'gridbutton.dart';

class Grid extends StatelessWidget {
  var numbers = [];
  var size;
  Function clickGrid;

  Grid(this.numbers, this.size, this.clickGrid);

  @override
  Widget build(BuildContext context) {
    var height = size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      height: height * 0.60,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 6.0,
          crossAxisSpacing: 6.0,
        ),
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return numbers[index] != 0
              ? GridButton("${numbers[index]}", () {
                  clickGrid(index);
                })
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
