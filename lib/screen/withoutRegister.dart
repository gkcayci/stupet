import 'package:stupet/color/color_theme.dart';
import 'package:stupet/screen/comingsoon.dart';
import 'package:stupet/screen/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:stupet/screen/withoutTimer.dart';

class WithoutRegister extends StatefulWidget {
  @override
  _WithoutRegisterState createState() => _WithoutRegisterState();
}

class _WithoutRegisterState extends State<WithoutRegister> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {});
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
        automaticallyImplyLeading: false,
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
              accountName: Text("Misafir",
                  style: TextStyle(color: ColorTheme().darkGray)),
              accountEmail:
                  Text(" ", style: TextStyle(color: ColorTheme().darkGray)),
              currentAccountPicture: Container(
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
                  backgroundImage: AssetImage('assets/maskot.png'),
                  backgroundColor: ColorTheme().darkGray.withOpacity(0.3),
                ),
              ),
              decoration: BoxDecoration(
                color: ColorTheme().yellow.withOpacity(0.5),
              ),
            ),
            ListTile(
                leading: Icon(Icons.person, color: ColorTheme().darkGray),
                title: Text("Profil",
                    style: TextStyle(color: ColorTheme().darkGray)),
                onTap: () {}),
            ListTile(
                leading: Icon(Icons.dark_mode_outlined,
                    color: ColorTheme().darkGray),
                title: Text("Tema",
                    style: TextStyle(color: ColorTheme().darkGray)),
                onTap: () {}),
            ListTile(
                leading:
                    Icon(Icons.login_outlined, color: ColorTheme().darkGray),
                title: Text("Çıkış",
                    style: TextStyle(color: ColorTheme().darkGray)),
                onTap: () {} //Çıkış
                ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorTheme().darkGray.withOpacity(0.9),
                        minimumSize: Size(double.infinity, 200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            size: 30,
                          ), // İstediğiniz bir icon
                          SizedBox(width: 8.0),
                          Text(
                            'Deneme\nVerileri',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorTheme().yellow,
                        minimumSize: Size(double.infinity, 200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.auto_graph_outlined,
                            size: 30,
                          ), // İstediğiniz bir icon
                          SizedBox(width: 8.0),
                          Text(
                            'Analiz',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Register()), //analiz sayfasına bağlanacak
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorTheme().yellow,
                        minimumSize: Size(double.infinity, 200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.assignment_outlined,
                            size: 30,
                          ), // İstediğiniz bir icon
                          SizedBox(width: 8.0),
                          Text(
                            'To-do',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorTheme().darkGray.withOpacity(0.9),
                        minimumSize: Size(double.infinity, 200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.alarm_outlined,
                            size: 30,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'Geri\nSayım',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WithoutTimerPage()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ColorTheme().darkGray.withOpacity(0.9),
                          minimumSize: Size(double.infinity, 200),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.checklist_outlined,
                              size: 30,
                            ), // İstediğiniz bir icon
                            SizedBox(width: 8.0),
                            Text(
                              'Konu\nTakibi',
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        }),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorTheme().yellow,
                        minimumSize: Size(double.infinity, 200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.question_mark_outlined,
                            size: 30,
                          ), // İstediğiniz bir icon
                          SizedBox(width: 8.0),
                          Text(
                            'Çok\nYakında',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ScrollableCardPage()), //analiz sayfasına bağlanacak
                        );
                      },
                    ),
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
