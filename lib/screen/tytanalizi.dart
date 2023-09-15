import 'package:flutter/material.dart';
import 'package:stupet/components/cardButton.dart';
import 'package:stupet/screen/analiz.dart';
import 'package:stupet/screen/veriler.dart';
import '../components/customAppBar.dart';

class derskonuanalizi extends StatefulWidget {
  const derskonuanalizi({Key? key}) : super(key: key);

  @override
  State<derskonuanalizi> createState() => _derskonuanaliziState();
}

class _derskonuanaliziState extends State<derskonuanalizi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "Konu Bazlı Analiz",
        onBackButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnalizPageExamKonu(),
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
                            builder: (context) => vericekme(),
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
                      onPressed: () {},
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
                      onPressed: () {},
                      image: 'assets/fizik.png',
                      imageSize: 100,
                      buttonText: 'Fizik',
                      buttonTextSize: 16,
                      containerHeight: 150,
                    ),
                    SizedBox(width: 8),
                    CardButton(
                      onPressed: () {},
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
                      onPressed: () {},
                      image: 'assets/biyo.png',
                      imageSize: 100,
                      buttonText: 'Biyoloji',
                      buttonTextSize: 16,
                      containerHeight: 150,
                    ),
                    SizedBox(width: 8),
                    CardButton(
                      onPressed: () {},
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
                      onPressed: () {},
                      image: 'assets/cografya.png',
                      imageSize: 100,
                      buttonText: 'Coğrafya',
                      buttonTextSize: 16,
                      containerHeight: 150,
                    ),
                    SizedBox(width: 8),
                    CardButton(
                      onPressed: () {},
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
                      onPressed: () {},
                      image: 'assets/geo.png',
                      imageSize: 100,
                      buttonText: 'Geometri',
                      buttonTextSize: 16,
                      containerHeight: 150,
                    ),
                    SizedBox(width: 8),
                    CardButton(
                      onPressed: () {},
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
    );
  }
}
