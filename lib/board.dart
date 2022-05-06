// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_redirect/store_redirect.dart';
import 'widgets/help_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'widgets/resetbutton.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'widgets/grid.dart';
import 'widgets/menu.dart';
import 'widgets/mytitle.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final player = AudioCache();

  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;
  int secondsPassed = 0;

  Timer? timer;
  static const duration = Duration(seconds: 1);
  bool isActive = false;

  DateTime timeBackPressed = DateTime.now();

  @override
  void initState() {
    super.initState();
    numbers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    timer ??= Timer.periodic(duration, (t) {
      startTime();
    });

    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= const Duration(seconds: 2);

        timeBackPressed = DateTime.now();

        if (isExitWarning) {
          const message =
              "All current progress will be lost. Press back again to exit.";
          Fluttertoast.showToast(msg: message, fontSize: 18);

          return false;
        } else {
          Fluttertoast.cancel();

          return true;
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SafeArea(
          child: Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTitle(size),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => SingleChildScrollView(
                                  child: HelpPage(),
                                ),
                              );
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.info_rounded,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              Share.share(
                                  'Hey! I found this awesome puzzle game called Slide 15 on Play Store. Make sure to try it out at - https://play.google.com/store/apps/details?id=com.vasudevsoni.slide15');
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.share_rounded,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Menu(move, secondsPassed),
                    Grid(numbers, size, clickGrid),
                    ResetButton(reset),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clickGrid(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      player.play('pop.wav', volume: 0.2);
      setState(() {
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
        move++;
      });
    } else {
      player.play('error.wav', volume: 0.2);
    }
    checkWin();
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      secondsPassed = 0;
      isActive = false;
    });
  }

  void startTime() {
    if (isActive) {
      setState(() {
        secondsPassed += 1;
      });
    }
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void checkWin() {
    if (isSorted(numbers)) {
      isActive = false;
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              height: 450,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
                        'Fantastic work.\nYou are a genius.\nNow celebrate your victory by sharing it with your friends and family.',
                        style: GoogleFonts.fredokaOne(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      "Moves made: $move",
                      style: GoogleFonts.fredokaOne(
                        fontSize: 15.0,
                        color: const Color(0xff495057),
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      "Time taken: $secondsPassed seconds",
                      style: GoogleFonts.fredokaOne(
                        fontSize: 15.0,
                        color: const Color(0xff495057),
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
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
                            'Close',
                            style: GoogleFonts.fredokaOne(
                              fontSize: 15.0,
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
                            Share.share(
                                'Hey! I solved the Slide 15 puzzle in $move moves and $secondsPassed seconds. Can you beat my score? Give it a try by downloading at - https://play.google.com/store/apps/details?id=com.vasudevsoni.slide15');
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.share_rounded),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Share',
                                style: GoogleFonts.fredokaOne(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xffBB77ED),
                            width: 2.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          reset();
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Start new game',
                          style: GoogleFonts.fredokaOne(
                            fontSize: 16.0,
                            color: const Color(0xffBB77ED),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xffBB77ED),
                            width: 2.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          StoreRedirect.redirect(
                            androidAppId: "com.vasudevsoni.slide15",
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.rate_review_rounded,
                              color: Color(0xffBB77ED),
                              size: 15.0,
                            ),
                            Text(
                              'Review us on Play Store',
                              style: GoogleFonts.fredokaOne(
                                fontSize: 12.0,
                                color: const Color(0xffBB77ED),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        barrierDismissible: false,
      );
      player.play('win_sound.wav');
    }
  }
}
