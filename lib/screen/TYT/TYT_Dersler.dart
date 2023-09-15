import 'package:flutter/material.dart';
import 'package:stupet/components/cardButton.dart';
import 'package:stupet/screen/TYT/tyt_biyoloji.dart';
import 'package:stupet/screen/TYT/tyt_cografya.dart';
import 'package:stupet/screen/TYT/tyt_din.dart';
import 'package:stupet/screen/TYT/tyt_felsefe.dart';
import 'package:stupet/screen/TYT/tyt_fizik.dart';
import 'package:stupet/screen/TYT/tyt_geometri.dart';
import 'package:stupet/screen/TYT/tyt_kimya.dart';
import 'package:stupet/screen/TYT/tyt_matematik.dart';
import 'package:stupet/screen/TYT/tyt_tarih.dart';
import 'package:stupet/screen/TYT/tyt_turkce.dart';
import 'package:stupet/screen/selectedTYT_AYT.dart';

import '../../components/customAppBar.dart';

class TYT_Dersler extends StatefulWidget {
  const TYT_Dersler({Key? key}) : super(key: key);

  @override
  State<TYT_Dersler> createState() => _TYT_DerslerState();
}

class _TYT_DerslerState extends State<TYT_Dersler> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: CustomAppBar(
            // title: "TYT Dersler",
            onBackButtonPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => selectedTYT_AYT(),
                ),
              );
            },
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tytTurkce(),
                              ),
                            );
                          },
                          image: 'assets/turkce.png',
                          imageSize: 100,
                          buttonText: 'Türkçe',
                          buttonTextSize: 16,
                          containerHeight: 150,
                        ),
                        SizedBox(width: 8),
                        CardButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tytMatematik(),
                              ),
                            );
                          },
                          image: 'assets/mat.png',
                          imageSize: 100,
                          buttonText: 'Temel Matematik',
                          buttonTextSize: 16,
                          containerHeight: 150,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tytFizik(),
                              ),
                            );
                          },
                          image: 'assets/fizik.png',
                          imageSize: 100,
                          buttonText: 'Fizik',
                          buttonTextSize: 16,
                          containerHeight: 150,
                        ),
                        SizedBox(width: 8),
                        CardButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tytKimya(),
                              ),
                            );
                          },
                          image: 'assets/kimya.png',
                          imageSize: 100,
                          buttonText: 'Kimya',
                          buttonTextSize: 16,
                          containerHeight: 150,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tytBiyoloji(),
                              ),
                            );
                          },
                          image: 'assets/biyo.png',
                          imageSize: 100,
                          buttonText: 'Biyoloji',
                          buttonTextSize: 16,
                          containerHeight: 150,
                        ),
                        SizedBox(width: 8),
                        CardButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tytTarih(),
                              ),
                            );
                          },
                          image: 'assets/tarih.png',
                          imageSize: 100,
                          buttonText: 'Tarih',
                          buttonTextSize: 16,
                          containerHeight: 150,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tytCografya(),
                              ),
                            );
                          },
                          image: 'assets/cografya.png',
                          imageSize: 100,
                          buttonText: 'Coğrafya',
                          buttonTextSize: 16,
                          containerHeight: 150,
                        ),
                        SizedBox(width: 8),
                        CardButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tytFelsefe(),
                              ),
                            );
                          },
                          image: 'assets/felsefe.png',
                          imageSize: 100,
                          buttonText: 'Felsefe',
                          buttonTextSize: 16,
                          containerHeight: 150,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tytGeometri(),
                              ),
                            );
                          },
                          image: 'assets/geo.png',
                          imageSize: 100,
                          buttonText: 'Geometri',
                          buttonTextSize: 16,
                          containerHeight: 150,
                        ),
                        SizedBox(width: 8),
                        CardButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tytdin(),
                              ),
                            );
                          },
                          image: 'assets/din.png',
                          imageSize: 90,
                          buttonText: 'Din Kültürü ve\n Ahlak Bilgisi',
                          buttonTextSize: 16,
                          containerHeight: 140,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
