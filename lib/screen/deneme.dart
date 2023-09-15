import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stupet/screen/selectedTYT_AYT.dart';
import '../components/customAppBar.dart';

class TabExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: TabExamplePage(),
      ),
    );
  }
}

class TabExamplePage extends StatefulWidget {
  @override
  _TabExamplePageState createState() => _TabExamplePageState();
}

class _TabExamplePageState extends State<TabExamplePage>
    with SingleTickerProviderStateMixin {
  final List<String> aytDropdownItems = [
    'AYT Matematik',
    'AYT Fizik',
    'AYT Kimya',
    'AYT Biyoloji',
    'AYT Din',
  ];

  String? selectedAYTValue;
  List<Map<String, dynamic>> aytCollectionData = [];
  Map<String, List<String>> selectedData = {};

  TabController? _tabController;
  bool showSavedData = false;

  int checkedItems = 0;
  int uncheckedItems = 0;
  double percentage = 0.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController!.removeListener(_handleTabChange);
    _tabController!.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (_tabController!.index == 0) {
      setState(() {
        selectedAYTValue = null;
        aytCollectionData.clear();
        showSavedData = false;
      });
    }
  }

  Future<void> getAYTCollectionData() async {
    if (selectedAYTValue != null) {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection(selectedAYTValue!).get();

      List<Map<String, dynamic>> data = [];
      snapshot.docs.forEach((doc) {
        Map<String, dynamic> entry = {
          'konu': doc.get("konu").toString(),
          'checked': false,
        };
        data.add(entry);
      });

      setState(() {
        aytCollectionData = data;
        showSavedData = false;
      });
    }
  }

  Future<void> saveCheckedDataToFirebase() async {
    String selectedCollection = '$selectedAYTValue takip';
    List<Map<String, dynamic>> checkedData =
        aytCollectionData.where((entry) => entry['checked']).toList();

    for (var data in checkedData) {
      String text = data['konu'];

      QuerySnapshot existingData = await FirebaseFirestore.instance
          .collection(selectedCollection)
          .where('text', isEqualTo: text)
          .get();

      if (existingData.docs.isEmpty) {
        await FirebaseFirestore.instance.collection(selectedCollection).add({
          'text': text,
        });
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Seçilen veriler Firebase\'e kaydedildi.'),
      ),
    );
  }

  void updateSelectedData() {
    if (selectedAYTValue != null) {
      List<String> selectedItems = aytCollectionData
          .where((entry) => entry['checked'])
          .map((entry) => entry['konu'].toString())
          .toList();
      selectedData[selectedAYTValue!] = selectedItems;
    }
  }

  void restoreSelectedData() {
    if (selectedAYTValue != null &&
        selectedData.containsKey(selectedAYTValue!)) {
      List<String> selectedItems = selectedData[selectedAYTValue!]!;
      for (var item in selectedItems) {
        int index = aytCollectionData
            .indexWhere((entry) => entry['konu'].toString() == item);
        if (index != -1) {
          aytCollectionData[index]['checked'] = true;
        }
      }
    }
  }

  Future<void> getSavedDataFromFirebase() async {
    String selectedCollection = '$selectedAYTValue takip';
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(selectedCollection).get();

    List<String> savedItems =
        snapshot.docs.map((doc) => doc.get('text').toString()).toList();
    for (var item in savedItems) {
      int index = aytCollectionData
          .indexWhere((entry) => entry['konu'].toString() == item);
      if (index != -1) {
        aytCollectionData[index]['checked'] = true;
      }
    }

    setState(() {
      showSavedData = true;
    });
  }

  void calculateCheckedPercentage() {
    checkedItems = aytCollectionData.where((entry) => entry['checked']).length;
    uncheckedItems = aytCollectionData.length - checkedItems;
    percentage = (checkedItems / aytCollectionData.length) * 100;

    setState(() {
      _tabController!.animateTo(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "Deneme Verileri",
        onBackButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => selectedTYT_AYT(),
            ),
          );
        },
      ),
      body: Column(
        children: [
          TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            controller: _tabController,
            tabs: [
              Tab(
                child: Text(
                  'AYT',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Tab(
                child: Text(
                  'TYT',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Tab(
                child: Text(
                  'Konu Takip',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                        hint: Text('Bir seçenek seçin'),
                        value: selectedAYTValue,
                        items: aytDropdownItems.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) async {
                          setState(() {
                            selectedAYTValue = newValue;
                          });
                          if (selectedAYTValue != null) {
                            aytCollectionData.clear();
                            await getAYTCollectionData();
                            restoreSelectedData();
                            await getSavedDataFromFirebase();
                          }
                        },
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Ders Konuları:',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Expanded(
                        child: ListView.builder(
                          itemCount: aytCollectionData.length,
                          itemBuilder: (BuildContext context, int index) {
                            bool isChecked = aytCollectionData[index]
                                    ['checked'] ||
                                (showSavedData &&
                                    aytCollectionData[index]['checked']);
                            return ListTile(
                              title: Text(
                                aytCollectionData[index]['konu'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color:
                                      isChecked ? Colors.green : Colors.black,
                                ),
                              ),
                              leading: Checkbox(
                                value: isChecked,
                                activeColor: Colors.green,
                                checkColor: Colors.white,
                                onChanged: (bool? value) {
                                  setState(() {
                                    aytCollectionData[index]['checked'] = value;
                                    updateSelectedData();
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          calculateCheckedPercentage();
                        },
                        child: Text('Yüzdeyi Hesapla'),
                      ),
                      ElevatedButton(
                        onPressed: saveCheckedDataToFirebase,
                        child: Text('Seçilen Verileri Kaydet'),
                      ),
                    ],
                  ),
                ),
                Center(child: Text('İçerik TYT')),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'İşaretlenmiş Öğeler: $checkedItems',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        'İşaretlenmemiş Öğeler: $uncheckedItems',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        'Yüzde: ${percentage.toStringAsFixed(2)}%',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
