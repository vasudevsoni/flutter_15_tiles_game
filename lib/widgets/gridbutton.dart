// ignore_for_file: must_be_immutable, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridButton extends StatelessWidget {
  Function click;
  String text;

  GridButton(this.text, this.click);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.fredokaOne(
              fontSize: 35.0,
              color: const Color(0xff495057),
            ),
          ),
        ),
      ),
      onTap: () {
        click();
      },
    );
  }
}
