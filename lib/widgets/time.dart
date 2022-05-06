// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Time extends StatelessWidget {
  int secondsPassed;

  Time(this.secondsPassed);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$secondsPassed seconds",
      style: GoogleFonts.fredokaOne(
        fontSize: 16.0,
        color: Colors.white,
      ),
    );
  }
}
