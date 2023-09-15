import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stupet/screen/AYT/ayt_esit_agirlik_konulari.dart';
import '../../components/customAppBar.dart';
import '../../components/questionList.dart';

class aytCografya extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(
          // title: "AYT Coğrafya",
          onBackButtonPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => aytEsitAgirlik(),
              ),
            );
          },
        ),
        body: FutureBuilder(
          future: fetchDropdownOptions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Veri yüklenirken bir hata oluştu'));
            }
            return QuestionList(
              dropdownOptions: snapshot.data as List<String>,
              textFieldController: _textFieldController,
              dersAdi: "AYT Coğrafya",
              kaydedildiMesaji: "Coğrafya Sorularınız Kaydedildi.",
            );
          },
        ),
      ),
    );
  }
}

Future<List<String>> fetchDropdownOptions() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('AYT Coğrafya').get();
  List<String> dropdownOptions = snapshot.docs.map((DocumentSnapshot document) {
    return document.get('konu') as String;
  }).toList();
  return dropdownOptions;
}
