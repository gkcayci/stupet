import 'package:flutter/material.dart';
import 'package:stupet/components/cardButton.dart';
import 'package:stupet/screen/analiz.dart';
import 'package:stupet/screen/homePage.dart';
import '../components/customAppBar.dart';

class AnalizPage extends StatefulWidget {
  const AnalizPage({Key? key}) : super(key: key);

  @override
  State<AnalizPage> createState() => _AnalizPageState();
}

class _AnalizPageState extends State<AnalizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "Konu Analiz",
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnalizPageExamKonu(),
                    ),
                  );
                },
                image: 'assets/konu.png',
                imageSize: 80,
                buttonText: 'Konu Analizi',
                buttonTextSize: 50,
                containerHeight: 150,
              ),
              SizedBox(width: 8),
              CardButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnalizPageExamKonu(),
                    ),
                  );
                },
                image: 'assets/net.png',
                imageSize: 80,
                buttonText: 'Net Analizi',
                buttonTextSize: 50,
                containerHeight: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
