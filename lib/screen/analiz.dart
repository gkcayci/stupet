import 'package:flutter/material.dart';
import 'package:stupet/components/cardButton.dart';
import 'package:stupet/screen/ayt_dil_analiz.dart';
import 'package:stupet/screen/ayt_esit_analiz.dart';
import 'package:stupet/screen/ayt_say_analiz.dart';
import 'package:stupet/screen/ayt_sozel_analiz.dart';
import 'package:stupet/screen/homePage.dart';
import '../components/customAppBar.dart';
import 'tytanalizi.dart';

class AnalizPageExamKonu extends StatelessWidget {
  const AnalizPageExamKonu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "Analiz",
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
                            builder: (context) => derskonuanalizi(),
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
                            builder: (context) => AytSayAnaliz(),
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
                            builder: (context) => AytSozelAnaliz(),
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
                            builder: (context) => AytEsitAnaliz(),
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
                            builder: (context) => AytDilAnaliz(),
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
