import 'package:flutter/material.dart';
import 'package:stupet/color/color_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/customAppBar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _username = "Kullanıcı Adı";
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _alanController = TextEditingController();
  TextEditingController _hedefUniversiteController = TextEditingController();
  TextEditingController _hedefBolumController = TextEditingController();
  TextEditingController _hedefNetController = TextEditingController();
  String? _selectedProfileImage;

  @override
  void initState() {
    super.initState();
    _usernameController.text = _username;
    _alanController.text = "Sayısal";
    _hedefUniversiteController.text = "İstanbul Teknik Üniversitesi";
    _hedefBolumController.text = "Bilgisayar Mühendisliği";
    _hedefNetController.text = "TYT: 110\n\nAYT: 75";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "Profil",
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorTheme().border,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _selectedProfileImage != null
                          ? AssetImage(_selectedProfileImage!)
                          : AssetImage('assets/maskot.png'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: ColorTheme().darkGray,
                    child: IconButton(
                      icon: Icon(Icons.edit, color: ColorTheme().white),
                      onPressed: _pickImage,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _username,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: _editUsername,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Profession and Code Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Alan',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: _editAlan,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(_alanController.text),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, right: 20),
                      child: Column(
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
                                color: ColorTheme().yellow,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Goals Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\n\nHedefler\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    buildGoalItem(
                        'Hedef Üniversite', _hedefUniversiteController),
                    SizedBox(height: 8),
                    buildGoalItem('Hedef Bölüm', _hedefBolumController),
                    SizedBox(height: 8),
                    buildGoalItem('Hedef Net', _hedefNetController),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGoalItem(String title, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorTheme().border,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _editGoal(controller);
                },
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(controller.text),
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

  void _editUsername() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kullanıcı Adını Düzenle'),
          content: TextField(
            controller: _usernameController,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Kaydet',
                style: TextStyle(color: ColorTheme().darkGray),
              ),
              onPressed: () {
                setState(() {
                  _username = _usernameController.text;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'İptal',
                style: TextStyle(color: ColorTheme().darkGray),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editAlan() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alan Adını Düzenle'),
          content: TextField(
            controller: _alanController,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Kaydet',
                style: TextStyle(color: ColorTheme().darkGray),
              ),
              onPressed: () {
                setState(() {
                  _alanController.text = _alanController.text;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'İptal',
                style: TextStyle(color: ColorTheme().darkGray),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editGoal(TextEditingController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hedefi Düzenle'),
          content: TextField(
            controller: controller,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Kaydet',
                style: TextStyle(color: ColorTheme().darkGray),
              ),
              onPressed: () {
                setState(() {
                  controller.text = controller.text;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'İptal',
                style: TextStyle(color: ColorTheme().darkGray),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _pickImage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Maskotunu Seç'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Image.asset('assets/maskot.png',
                    fit: BoxFit.cover, width: 100, height: 100),
                title: Text('Stupet'),
                onTap: () {
                  setState(() {
                    _selectedProfileImage = 'assets/maskot.png';
                  });
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Image.asset('assets/maskot2.png',
                    fit: BoxFit.cover, width: 100, height: 100),
                title: Text('Bilgeo'),
                onTap: () {
                  setState(() {
                    _selectedProfileImage = 'assets/maskot2.png';
                  });
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Image.asset('assets/maskot4.png',
                    fit: BoxFit.cover, width: 100, height: 100),
                title: Text('Dersito'),
                onTap: () {
                  setState(() {
                    _selectedProfileImage = 'assets/maskot4.png';
                  });
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Image.asset('assets/maskot5.png',
                    fit: BoxFit.cover, width: 100, height: 100),
                title: Text('Akademina'),
                onTap: () {
                  setState(() {
                    _selectedProfileImage = 'assets/maskot5.png';
                  });
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Image.asset('assets/maskot6.png',
                    fit: BoxFit.cover, width: 90, height: 90),
                title: Text('Akademix'),
                onTap: () {
                  setState(() {
                    _selectedProfileImage = 'assets/maskot6.png';
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'İptal',
                style: TextStyle(color: ColorTheme().darkGray),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
