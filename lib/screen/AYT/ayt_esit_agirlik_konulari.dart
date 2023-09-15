import 'package:flutter/material.dart';
import 'package:stupet/components/cardButton.dart';
import 'package:stupet/screen/AYT/ayt_cografya.dart';
import 'package:stupet/screen/AYT/ayt_edebiyat.dart';
import 'package:stupet/screen/AYT/ayt_matematik.dart';
import 'package:stupet/screen/AYT/ayt_tarih.dart';
import 'package:stupet/screen/selectedTYT_AYT.dart';

import '../../components/customAppBar.dart';

class aytEsitAgirlik extends StatefulWidget {
  const aytEsitAgirlik({Key? key}) : super(key: key);
  @override
  State<aytEsitAgirlik> createState() => _aytEsitAgirlikState();
}

class _aytEsitAgirlikState extends State<aytEsitAgirlik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "AYT Eşit Ağırlık",
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
                            builder: (context) => aytEdebiyat(),
                          ),
                        );
                      },
                      image: 'assets/turkce.png',
                      buttonText: 'Edebiyat',
                      containerHeight: 150,
                    ),
                    SizedBox(width: 16),
                    CardButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => aytTarih(),
                          ),
                        );
                      },
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => aytCografya(),
                          ),
                        );
                      },
                      image: 'assets/cografya.png',
                      buttonText: 'Coğrafya',
                      containerHeight: 150,
                    ),
                    SizedBox(width: 16),
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
