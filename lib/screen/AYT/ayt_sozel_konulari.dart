import 'package:flutter/material.dart';
import 'package:stupet/components/cardButton.dart';
import 'package:stupet/screen/AYT/ayt_cografya.dart';
import 'package:stupet/screen/AYT/ayt_edebiyat.dart';
import 'package:stupet/screen/AYT/ayt_felsefe.dart';
import 'package:stupet/screen/AYT/ayt_tarih.dart';
import 'package:stupet/screen/selectedTYT_AYT.dart';

import '../../components/customAppBar.dart';

class aytSozel extends StatefulWidget {
  const aytSozel({Key? key}) : super(key: key);
  @override
  State<aytSozel> createState() => _aytSozelState();
}

class _aytSozelState extends State<aytSozel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "AYT Sözel",
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
                            builder: (context) => aytFelsefe(),
                          ),
                        );
                      },
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
