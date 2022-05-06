// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store_redirect/store_redirect.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                margin: const EdgeInsets.symmetric(vertical: 15.0),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'How to play this game?',
                      style: GoogleFonts.fredokaOne(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 2.0,
                    ),
                    ListTile(
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      leading: const Icon(Icons.fiber_manual_record),
                      title: Text(
                        'Click on the number tiles to move them.',
                        style: GoogleFonts.fredokaOne(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      leading: const Icon(Icons.fiber_manual_record),
                      title: Text(
                        'Adjust the tiles in ascending order from 1-15 to win the game.\nSee image for reference.',
                        style: GoogleFonts.fredokaOne(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Image.network(
                      'https://res.cloudinary.com/websiteimages/image/upload/v1645607604/Website%20Pics/Capture_kw7o4o.png',
                      width: 400,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    ListTile(
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      leading: const Icon(Icons.fiber_manual_record),
                      title: Text(
                        'Your time will start as soon as you make your first move.',
                        style: GoogleFonts.fredokaOne(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      leading: const Icon(Icons.fiber_manual_record),
                      title: Text(
                        'All your valid moves will be counted and shown to you on the screen.',
                        style: GoogleFonts.fredokaOne(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      leading: const Icon(Icons.fiber_manual_record),
                      title: Text(
                        'Click on SHUFFLE to start a new game. Please note that all your current progress will be lost.',
                        style: GoogleFonts.fredokaOne(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      leading: const Icon(Icons.fiber_manual_record),
                      title: Text(
                        'Enjoy and don\'t forget to share with your friends and family.',
                        style: GoogleFonts.fredokaOne(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      trailing: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Share.share(
                                'Hey! I found this awesome puzzle game called Slide 15 on Play Store. Make sure to try it out at - https://play.google.com/store/apps/details?id=com.vasudevsoni.slide15');
                          },
                          icon: const Icon(
                            Icons.share_rounded,
                            color: Color(0xffBB77ED),
                          ),
                        ),
                      ),
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
                        StoreRedirect.redirect(
                          androidAppId: "com.vasudevsoni.slide15",
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.rate_review_rounded,
                              color: Colors.white,
                              size: 15.0,
                            ),
                            Text(
                              'Review us on Play Store',
                              style: GoogleFonts.fredokaOne(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
