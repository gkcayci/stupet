import 'package:flutter/material.dart';
import 'package:stupet/screen/analiz.dart';
import '../../components/customAppBar.dart';

class AytDilAnaliz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(
          // title: "AYT Dil",
          onBackButtonPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AnalizPageExamKonu(),
              ),
            );
          },
        ),
        body: Container(),
      ),
    );
  }
}
