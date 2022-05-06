// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class ResetButton extends StatelessWidget {
  final player = AudioCache();
  Function reset;
  ResetButton(this.reset);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Colors.white,
            width: 3.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enableFeedback: false,
        ),
        child: Text(
          "SHUFFLE",
          style: GoogleFonts.fredokaOne(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          player.play('shuffle.wav', volume: 0.2);
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff1CDCE8),
                                  Color(0xffBB77ED),
                                ],
                              ),
                            ),
                            child: Text(
                              'Are you sure you want to shuffle the tiles?\nAll current progress will be lost.',
                              style: GoogleFonts.fredokaOne(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.fredokaOne(
                                  fontSize: 13.0,
                                  color: const Color(0xff495057),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xffBB77ED),
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                reset();
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Yes, shuffle',
                                style: GoogleFonts.fredokaOne(
                                  fontSize: 13.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
