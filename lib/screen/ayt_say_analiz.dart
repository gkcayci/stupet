import 'package:flutter/material.dart';
import 'package:stupet/components/cardButton.dart';
import 'package:stupet/screen/analiz.dart';
import '../../components/customAppBar.dart';

class AytSayAnaliz extends StatefulWidget {
  const AytSayAnaliz({Key? key}) : super(key: key);
  @override
  State<AytSayAnaliz> createState() => _AytSayAnalizState();
}

class _AytSayAnalizState extends State<AytSayAnaliz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "AYT Analiz Sayısal",
        onBackButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnalizPageExamKonu(),
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
                      onPressed: () {},
                      image: 'assets/mat.png',
                      buttonText: 'Matematik',
                      containerHeight: 150,
                    ),
                    SizedBox(width: 16),
                    CardButton(
                      onPressed: () {},
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
                      onPressed: () {},
                      image: 'assets/fizik.png',
                      buttonText: 'Fizik',
                      containerHeight: 150,
                    ),
                    SizedBox(width: 16),
                    CardButton(
                      onPressed: () {},
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
