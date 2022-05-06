// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Move extends StatelessWidget {
  int move;

  Move(this.move);
  @override
  Widget build(BuildContext context) {
    return Text(
      "$move moves",
      style: GoogleFonts.fredokaOne(
        fontSize: 16.0,
        color: Colors.white,
      ),
    );
  }
}
