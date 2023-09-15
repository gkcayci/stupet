import 'package:flutter/material.dart';
import 'package:stupet/components/cardButton.dart';
import 'package:stupet/screen/AYT/ayt_biyoloji.dart';
import 'package:stupet/screen/AYT/ayt_fizik.dart';
import 'package:stupet/screen/AYT/ayt_kimya.dart';
import 'package:stupet/screen/AYT/ayt_matematik.dart';
import 'package:stupet/screen/selectedTYT_AYT.dart';

import '../../components/customAppBar.dart';

class aytSayisal extends StatefulWidget {
  const aytSayisal({Key? key}) : super(key: key);
  @override
  State<aytSayisal> createState() => _aytSayisalState();
}

class _aytSayisalState extends State<aytSayisal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "AYT Sayısal",
        onBackButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => selectedTYT_AYT(),
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
                            builder: (context) => aytMatematik(),
                          ),
                        );
                      },
                      image: 'assets/mat.png',
                      buttonText: 'Matematik',
                      containerHeight: 150,
                    ),
                    SizedBox(width: 16),
                    CardButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => aytKimya(),
                          ),
                        );
                      },
                      image: 'assets/kimya.png',
                      buttonText: 'Kimya',
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
                            builder: (context) => aytFizik(),
                          ),
                        );
                      },
                      image: 'assets/fizik.png',
                      buttonText: 'Fizik',
                      containerHeight: 150,
                    ),
                    SizedBox(width: 16),
                    CardButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => aytBiyoloji(),
                          ),
                        );
                      },
                      image: 'assets/biyo.png',
                      buttonText: 'Biyoloji',
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
