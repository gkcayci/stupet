import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import '../color/color_theme.dart';
import 'homePage.dart';

class kayit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePagee(),
    );
  }
}

class ProfilePagee extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePagee> {
  String name = "";

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  void fetchProfileData() async {
    final profileSnapshot = await FirebaseFirestore.instance
        .collection('profile_info')
        .doc('your_user_id_here')
        .get();
    final data = profileSnapshot.data();
    setState(() {
      name = data?['name'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.75),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined),
              color: ColorTheme().blackbean,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 100,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: ColorTheme().blackbean,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(
                    name: name,
                    onProfileUpdated: updateProfile,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorTheme().border, // Kenar rengi
                  width: 2, // Kenar kalınlığı
                ),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/maskot.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              "İsim: $name",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            // Profession and Code Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\nAlan\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Sayısal'),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'YÖK Atlas',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          launchURL('https://yokatlas.yok.gov.tr');
                        },
                        child: Text(
                          "URL'ye git",
                          style: TextStyle(
                            color: ColorTheme().yellow, // Butonun metin rengi
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Goals Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\n\nHedefler\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hedef Üniversite\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('İstanbul Teknik Üniversitesi'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hedef Bölüm\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Bilgisayar Mühendisliği'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hedef Net\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('TYT: 110'),
                            Text('\nAYT: 75')
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Current Status Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\n\nDers Durumları\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      buildLessonProgress('Fizik\n', 45),
                      Text("\n\n%45")
                    ],
                  ),
                  Row(
                    children: [
                      buildLessonProgress('Matematik 2\n', 10),
                      Text("\n\n%10")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget buildLessonProgress(String lesson, int progress) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            lesson,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          LinearProgressIndicator(
            value: progress / 100,
            color: ColorTheme().yellow,
            backgroundColor: ColorTheme().yellow.withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void updateProfile(String newName) {
    setState(() {
      name = newName;
    });
  }
}

class EditProfilePage extends StatefulWidget {
  final String name;
  final Function(String) onProfileUpdated;

  EditProfilePage({required this.name, required this.onProfileUpdated});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.75),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined),
              color: ColorTheme().blackbean,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 100,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: ColorTheme().blackbean,
            onPressed: () {
              ;
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorTheme().border,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'assets/maskot.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "İsim"),
            ),
            Text(
              'Hedefler',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Hedef Üniversite',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Hedef Bölüm',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Hedef TYT Neti',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Hedef AYT Neti',
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorTheme().yellow,
                ),
                child: Text("Değişiklikleri Kaydet"),
                onPressed: () {
                  String newName = nameController.text;
                  widget.onProfileUpdated(newName);
                  updateFirebaseProfile(newName);
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }

  void updateFirebaseProfile(String newName) async {
    await FirebaseFirestore.instance
        .collection('profil')
        .doc('kullanici')
        .update({
      'isim': newName,
    });
  }
}
