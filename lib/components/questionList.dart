import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stupet/color/color_theme.dart';

class QuestionList extends StatefulWidget {
  final String dersAdi;
  final List<String> dropdownOptions;
  final TextEditingController textFieldController;
  final String kaydedildiMesaji;

  QuestionList({
    required this.dersAdi,
    required this.dropdownOptions,
    required this.textFieldController,
    required this.kaydedildiMesaji,
  });

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  List<QuestionWidget> questionWidgets = [];
  List<Map<String, dynamic>> allResults = [];

  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= 6; i++) {
      questionWidgets.add(QuestionWidget(i, widget.dropdownOptions));
    }
    fetchAllResults();
  }

  Future<void> fetchAllResults() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(widget.dersAdi).get();
    List<Map<String, dynamic>> results =
        snapshot.docs.map((DocumentSnapshot document) {
      return document.data() as Map<String, dynamic>;
    }).toList();

    setState(() {
      allResults.addAll(results);
    });
  }

  void analyzeResults() {
    List<Map<String, dynamic>> correctResults = [];

    for (var result in allResults) {
      if (result['Değer'] == '1') {
        correctResults.add({
          'Soru Sayısı': result['Soru Sayısı'],
          'konu': result['konu'],
        });
      }
    }

    print('Doğru İşaretlenmiş Sorular:');
    for (var result in correctResults) {
      print('Soru ${result['Soru Sayısı']}: ${result['konu']}');
    }
  }

  void printAllResults() {
    print('Tüm Sonuçlar:');
    for (var result in allResults) {
      print(
          'Soru ${result['Soru Sayısı']}: ${result['konu']} ${result['Değer'] == '1' ? 'Doğru' : 'Yanlış'}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 30)),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorTheme().yellow,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    '${widget.dersAdi} Soru Konu Dağılımı',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 30)),
        Expanded(
          child: ListView.builder(
            itemCount: questionWidgets.length,
            itemBuilder: (context, index) {
              return questionWidgets[index];
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 100),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    List<Map<String, dynamic>> resultData = [];

                    for (int i = 0; i < questionWidgets.length; i++) {
                      Map<String, dynamic> result = {
                        'Soru Sayısı': questionWidgets[i].questionNumber,
                        'konu': questionWidgets[i].selectedOption,
                        'Değer':
                            questionWidgets[i].greenButtonSelected ? '1' : '0',
                      };
                      resultData.add(result);
                    }

                    FirebaseFirestore.instance.collection(widget.dersAdi).add({
                      'timestamp': DateTime.now(),
                      'results': resultData,
                      'deneme adı': widget.textFieldController.text,
                    });

                    allResults.addAll(resultData);

                    for (int i = 0; i < questionWidgets.length; i++) {
                      print(
                          'Soru ${i + 1}: ${questionWidgets[i].selectedOption} ${questionWidgets[i].greenButtonSelected ? '1' : '0'}');
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(widget.kaydedildiMesaji),
                      ),
                    );
                  },
                  child: Text('Kaydet'),
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().yellow,
                    onPrimary: Colors.white,
                    minimumSize: Size(100, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    analyzeResults();
                  },
                  child: Text('Net Hesapla'),
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().yellow,
                    onPrimary: Colors.white,
                    minimumSize: Size(100, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class QuestionWidget extends StatefulWidget {
  final int questionNumber;
  String? selectedOption;
  bool greenButtonSelected = false;
  bool redButtonSelected = false;
  List<String> dropdownOptions;

  QuestionWidget(this.questionNumber, this.dropdownOptions);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  Color textBackgroundColor = Colors.white24;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
      child: Container(
        decoration: BoxDecoration(
          color: textBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '   Soru ${widget.questionNumber}',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 160.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: widget.selectedOption,
                  items: widget.dropdownOptions.map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          option.length > 25
                              ? option.substring(0, 25) + "..."
                              : option,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      widget.selectedOption = value;
                    });
                  },
                  isExpanded: true,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  textBackgroundColor = Colors.green;
                  widget.greenButtonSelected = true;
                  widget.redButtonSelected = false;
                });
              },
              icon: Icon(Icons.check, color: Colors.green),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  textBackgroundColor = Colors.red;
                  widget.greenButtonSelected = false;
                  widget.redButtonSelected = true;
                });
              },
              icon: Icon(Icons.close, color: Colors.red),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  textBackgroundColor = Colors.white;
                  widget.greenButtonSelected = false;
                  widget.redButtonSelected = false;
                });
              },
              icon: Icon(Icons.restore, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
