import 'package:flutter/material.dart';
import 'package:stupet/components/cardButton.dart';
import 'package:stupet/screen/analiz.dart';
import '../../components/customAppBar.dart';

class AytSozelAnaliz extends StatefulWidget {
  const AytSozelAnaliz({Key? key}) : super(key: key);
  @override
  State<AytSozelAnaliz> createState() => _AytSozelAnalizState();
}

class _AytSozelAnalizState extends State<AytSozelAnaliz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "AYT Sözel",
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
                      buttonText: 'Tarih-2',
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
                      image: 'assets/felsefe.png',
                      buttonText: 'Felsefe',
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
