import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stupet/screen/AYT/ayt_sozel_konulari.dart';
import '../../components/customAppBar.dart';
import '../../components/questionList.dart';

class aytFelsefe extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(
          // title: "AYT Felsefe",
          onBackButtonPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => aytSozel(),
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
              dersAdi: "AYT Felsefe",
              kaydedildiMesaji: "Felsefe Sorularınız Kaydedildi.",
            );
          },
        ),
      ),
    );
  }
}

Future<List<String>> fetchDropdownOptions() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('AYT Felsefe').get();
  List<String> dropdownOptions = snapshot.docs.map((DocumentSnapshot document) {
    return document.get('konu') as String;
  }).toList();
  return dropdownOptions;
}
