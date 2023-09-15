import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stupet/screen/konuanalizi.dart';
import '../color/color_theme.dart';
import '../components/customAppBar.dart';

class vericekme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "",
        onBackButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnalizPage(),
            ),
          );
        },
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('results').snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Hata: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('Veri yok.'),
            );
          }

          List<Map<String, dynamic>> incorrectAnswers = [];
          List<Map<String, dynamic>> analysisResults = [];

          snapshot.data!.docs
              .forEach((DocumentSnapshot<Map<String, dynamic>> document) {
            List<Map<String, dynamic>> results =
                List<Map<String, dynamic>>.from(
                    document.data()!['results'] ?? []);

            results.forEach((result) {
              int? questionNumber = (result['Soru Sayısı'] as int?) ?? 0;
              String? resultValue = result['Değer']?.toString();
              String? selectedOption = result['konu'] as String?;

              if (resultValue == '0') {
                incorrectAnswers.add({
                  'question': 'Soru: $questionNumber',
                  'konu': 'Konu: $selectedOption',
                });
              }
            });
          });

          incorrectAnswers.forEach((incorrectAnswer) {
            String? selectedOption = incorrectAnswer['konu'] as String?;
            int count = incorrectAnswers
                .where((answer) => answer['konu'] == selectedOption)
                .toList()
                .length;

            if (count > 3 &&
                !analysisResults
                    .any((result) => result['konu'] == selectedOption)) {
              analysisResults.add({
                'konu': selectedOption,
                'count': count,
              });
            }
          });

          return ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              ListTile(
                  title: Text(
                    'Yanlış Yapılan Sorular',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  tileColor: ColorTheme().yellow),
              ...incorrectAnswers.map(
                (answer) => ListTile(
                  title: Text(answer['question'] ?? ''),
                  subtitle: Text(answer['konu'] ?? ''),
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text(
                  'Yanlış Sayısı',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                tileColor: _getBackgroundColor(analysisResults.length),
                trailing: Icon(
                  _getIconData(analysisResults.length),
                  color: Colors.white,
                ),
              ),
              // Yanlış yapılan konuları gösteren alan
              ...analysisResults.map((result) {
                final konu = result['konu'] as String;
                final count = result['count'] as int;
                return ListTile(
                  title: Text('$konu konusunda'),
                  subtitle: Text('$count yanlış yapıldı'),
                );
              }).toList(),
              SizedBox(height: 16),
              ListTile(
                title: Text(
                  'Analiz Sonucu:',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                tileColor: ColorTheme().yellow,
              ),
              ...analysisResults.map(
                (result) {
                  final selectedOption = result['konu'] as String?;
                  final count = result['count'] as int?;

                  if (count != null && count > 2) {
                    return ListTile(
                      title: Text(
                        'Üçten fazla yanlış yaptığın konular:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(selectedOption ?? ''),
                    );
                  } else {
                    return ListTile(
                      title: Text('Selected Option: $selectedOption'),
                      subtitle: Text('Count: $count'),
                    );
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

Color _getBackgroundColor(int? count) {
  if (count == null) {
    return Colors.green;
  } else if (count == 2 || count == 3) {
    return Colors.orange;
  } else if (count > 3) {
    return Colors.red;
  } else {
    return Colors.green;
  }
}

IconData _getIconData(int length) {
  if (length > 2) {
    return Icons.error;
  } else if (length > 0) {
    return Icons.warning;
  } else {
    return Icons.check;
  }
}

int _getTotalIncorrectCount(List<Map<String, dynamic>> analysisResults) {
  int totalIncorrectCount = 0;
  analysisResults.forEach((result) {
    int count = result['count'] as int;
    totalIncorrectCount += count;
  });
  return totalIncorrectCount;
}
