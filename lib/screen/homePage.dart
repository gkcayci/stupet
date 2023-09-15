import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stupet/color/color_theme.dart';
import 'package:stupet/screen/konuanalizi.dart';
import 'package:stupet/screen/loginPage.dart';
import 'package:stupet/screen/news.dart';
import 'package:stupet/screen/notes.dart';
import 'package:stupet/screen/pomodoro.dart';
import 'package:stupet/screen/profilePage.dart';

import 'package:stupet/screen/selectedTYT_AYT.dart';
import 'package:stupet/screen/timer.dart';
import 'package:flutter/material.dart';
import 'package:stupet/screen/todo.dart';

import 'cokyakinda.dart';
import 'konuTakip.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dailyQuote = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getDailyQuote();
  }

  Future<void> _getDailyQuote() async {
    var collection = FirebaseFirestore.instance.collection('Motivasyon');
    var querySnapshot = await collection.get();
    var totalQuotes = querySnapshot.docs.length;
    var random = Random();
    var randomIndex = random.nextInt(totalQuotes);
    var quote = querySnapshot.docs[randomIndex].get('söz');

    setState(() {
      dailyQuote = quote;
      isLoading = false;
    });

    _showPopup();
  }

  void _showPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: isLoading ? CircularProgressIndicator() : Text(dailyQuote),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: CircleBorder(),
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme().backgroundColor,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Image.asset(
                      'assets/logo.png',
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Kullanıcı Adı",
                  style: TextStyle(color: ColorTheme().darkGray)),
              accountEmail: Text("kullanici@ornek.com",
                  style: TextStyle(color: ColorTheme().darkGray)),
              currentAccountPicture: Container(
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
                  backgroundColor: ColorTheme().darkGray.withOpacity(0.3),
                ),
              ),
              decoration: BoxDecoration(
                color: ColorTheme()
                    .yellow
                    .withOpacity(0.5), // Arka plan rengini değiştirme
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: ColorTheme().darkGray),
              title: Text("Profil",
                  style: TextStyle(color: ColorTheme().darkGray)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.dark_mode_outlined, color: ColorTheme().darkGray),
              title:
                  Text("Tema", style: TextStyle(color: ColorTheme().darkGray)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage()), //darkmode
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.login_outlined, color: ColorTheme().darkGray),
              title:
                  Text("Çıkış", style: TextStyle(color: ColorTheme().darkGray)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()), //Çıkış
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeButton(
                        buttonText: "Deneme\nVerileri",
                        backgroundColor: ColorTheme().yellow,
                        icon: Icons.edit,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => selectedTYT_AYT()),
                          );
                        },
                        buttonTextSize: 25.0,
                        containerHeight: 200.0,
                        containerWidht: 300.0),
                    SizedBox(width: 8),
                    HomeButton(
                        buttonText: "Analiz",
                        backgroundColor: ColorTheme().darkGray,
                        icon: Icons.auto_graph_outlined,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnalizPage()),
                          );
                        },
                        buttonTextSize: 25.0,
                        containerHeight: 200.0,
                        containerWidht: 300.0),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeButton(
                        buttonText: "To-do",
                        backgroundColor: ColorTheme().darkGray,
                        icon: Icons.assignment_outlined,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => todo()),
                          );
                        },
                        buttonTextSize: 25.0,
                        containerHeight: 200.0,
                        containerWidht: 300.0),
                    SizedBox(width: 8),
                    HomeButton(
                        buttonText: "Geri\nSayım",
                        backgroundColor: ColorTheme().yellow,
                        icon: Icons.alarm_outlined,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TimerPage()),
                          );
                        },
                        buttonTextSize: 25.0,
                        containerHeight: 200.0,
                        containerWidht: 300.0),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeButton(
                        buttonText: "Konu\nTakibi",
                        backgroundColor: ColorTheme().yellow,
                        icon: Icons.checklist_outlined,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KonuTakip()),
                          );
                        },
                        buttonTextSize: 25.0,
                        containerHeight: 200.0,
                        containerWidht: 300.0),
                    SizedBox(width: 8),
                    HomeButton(
                        buttonText: "Notlarım",
                        backgroundColor: ColorTheme().darkGray,
                        icon: Icons.library_books_outlined,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotesPage()),
                          );
                        },
                        buttonTextSize: 25.0,
                        containerHeight: 200.0,
                        containerWidht: 300.0),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeButton(
                        buttonText: "Pomodoro",
                        backgroundColor: ColorTheme().darkGray,
                        icon: Icons.timer_outlined,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PomodoroPage()),
                          );
                        },
                        buttonTextSize: 25.0,
                        containerHeight: 200.0,
                        containerWidht: 300.0),
                    SizedBox(width: 8),
                    HomeButton(
                        buttonText: "Haberin\nOlsun",
                        backgroundColor: ColorTheme().yellow,
                        icon: Icons.link_outlined,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewsPage()),
                          );
                        },
                        buttonTextSize: 25.0,
                        containerHeight: 200.0,
                        containerWidht: 300.0),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final IconData icon;
  final String buttonText;
  final double buttonTextSize;
  final double containerHeight;
  final double containerWidht;

  const HomeButton({
    required this.onPressed,
    required this.backgroundColor,
    required this.icon,
    required this.buttonText,
    this.buttonTextSize = 25.0,
    this.containerHeight = 100.0,
    this.containerWidht = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            height: containerHeight,
            width: containerWidht,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(width: 8),
                Text(
                  buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorTheme().white,
                    fontSize: buttonTextSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
