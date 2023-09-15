import 'package:flutter/material.dart';
import 'package:stupet/components/cardButton.dart';
import 'package:stupet/screen/analiz.dart';
import '../../components/customAppBar.dart';

class AytEsitAnaliz extends StatefulWidget {
  const AytEsitAnaliz({Key? key}) : super(key: key);
  @override
  State<AytEsitAnaliz> createState() => _AytEsitAnalizState();
}

class _AytEsitAnalizState extends State<AytEsitAnaliz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "AYT Eşit Ağırlık",
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
                      image: 'assets/turkce.png',
                      buttonText: 'Edebiyat',
                      containerHeight: 150,
                    ),
                    SizedBox(width: 16),
                    CardButton(
                      onPressed: () {},
                      image: 'assets/tarih.png',
                      buttonText: 'Tarih',
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
                      image: 'assets/cografya.png',
                      buttonText: 'Coğrafya',
                      containerHeight: 150,
                    ),
                    SizedBox(width: 16),
                    CardButton(
                      onPressed: () {},
                      image: 'assets/mat.png',
                      buttonText: 'Matematik',
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
