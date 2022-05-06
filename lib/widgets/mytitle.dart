// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTitle extends StatelessWidget {
  var size;

  MyTitle(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Slide 15',
            style: GoogleFonts.rancho(
              fontSize: 40.0,
              letterSpacing: 0.7,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            'THE ULTIMATE PUZZLE',
            style: GoogleFonts.rancho(
              fontSize: 15.0,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
