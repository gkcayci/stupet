import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stupet/color/color_theme.dart';
import 'package:stupet/components/cardButton.dart';
import 'package:stupet/screen/AYT/ayt_sozel_konulari.dart';
import 'package:stupet/screen/homePage.dart';

import '../components/customAppBar.dart';
import 'AYT/ayt_dil_konulari.dart';
import 'AYT/ayt_esit_agirlik_konulari.dart';
import 'AYT/ayt_sayisal_konulari.dart';
import 'TYT/TYT_Dersler.dart';

class selectedTYT_AYT extends StatefulWidget {
  const selectedTYT_AYT({Key? key}) : super(key: key);

  @override
  State<selectedTYT_AYT> createState() => _selectedTYT_AYTState();
}

class _selectedTYT_AYTState extends State<selectedTYT_AYT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "Ders Seç",
        onBackButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CardButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TYT_Dersler(),
                          ),
                        );
                      },
                      image: 'assets/tyt.png',
                      buttonText: 'TYT',
                      containerHeight: 150,
                    ),
                    SizedBox(width: 16),
                    CardButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => aytSayisal(),
                          ),
                        );
                      },
                      image: 'assets/ayt-say.png',
                      buttonText: 'AYT-SAYISAL',
                      containerHeight: 150,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Row(
                  children: [
                    CardButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => aytSozel(),
                          ),
                        );
                      },
                      image: 'assets/ayt-soz.png',
                      buttonText: 'AYT-SÖZEL',
                      containerHeight: 150,
                    ),
                    SizedBox(width: 16),
                    CardButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => aytEsitAgirlik(),
                          ),
                        );
                      },
                      image: 'assets/ayt-ea.png',
                      buttonText: 'AYT-EŞİT AĞIRLIK',
                      containerHeight: 150,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Row(
                  children: [
                    CardButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => aytDil(),
                          ),
                        );
                      },
                      image: 'assets/ayt-dil.png',
                      buttonText: 'AYT-DİL',
                      containerHeight: 150,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
