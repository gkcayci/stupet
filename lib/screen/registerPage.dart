import 'package:firebase_auth/firebase_auth.dart';
import 'package:stupet/color/color_theme.dart';
import 'package:stupet/screen/loginPage.dart';
import 'package:stupet/screen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:stupet/screen/withoutRegister.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String email, password;
  bool _obscureText = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  'assets/logo.png',
                  height: 200,
                ),
              ),
            ],
          ),
          SizedBox(height: 150),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.withOpacity(0.2),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: ListTile(
                            title: TextFormField(
                              validator: (input) {
                                if (input!.isEmpty) {
                                  return 'Email alanı boş olamaz';
                                }
                                return null;
                              },
                              onSaved: (input) => email = input!,
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.alternate_email),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.withOpacity(0.2),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: ListTile(
                            title: TextFormField(
                              obscureText: _obscureText,
                              validator: (input) {
                                if (input!.length < 6) {
                                  return 'Şifre en az 6 karakter olmalı';
                                }
                                return null;
                              },
                              onSaved: (input) => password = input!,
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                  hintText: "Parola",
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey.withOpacity(0.2),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: ListTile(
                            title: TextFormField(
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                  hintText: "Parolayı tekrar girin",
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(8.0),
                        color: ColorTheme().yellow,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: signUp,
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            "Üye Ol",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0),
                          ),
                        ),
                      ),
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child: Divider(
                        color: ColorTheme().border,
                        height: 70,
                      )),
                      Text("Ya da"),
                      Expanded(
                          child: Divider(
                        color: ColorTheme().border,
                        height: 70,
                      )),
                    ]),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        14.0, 8.0, 14.0, 8.0),
                                    child: Text(
                                      "Google ile üye ol",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ColorTheme().grey),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        14.0, 8.0, 14.0, 8.0),
                                    child: Text(
                                      'Üye olmadan giriş yap',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: ColorTheme().grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        14.0, 8.0, 14.0, 8.0),
                                    child: Material(
                                        child: MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SplashScreen()),
                                              );
                                            },
                                            child: Image.asset(
                                              "assets/google.png",
                                              width: 45,
                                            ))),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        14.0, 8.0, 14.0, 8.0),
                                    child: Material(
                                        child: MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        WithoutRegister()),
                                              );
                                            },
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 45,
                                              color: ColorTheme().yellow,
                                            ))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: ColorTheme().border,
                      height: 20,
                    ),
                    Expanded(
                      child: Column(children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 8.0, 14.0, 8.0),
                                  child: Text(
                                    "Zaten hesabınız var mı?",
                                    style: TextStyle(
                                        fontSize: 15, color: ColorTheme().grey),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 8.0, 14.0, 8.0),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                    child: Text(
                                      'Giriş yap',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: ColorTheme().darkBlue),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void signUp() async {
    final formState = _formKey.currentState!;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        _showSuccessDialog();
        print(user.user!.uid);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SplashScreen()),
        );
        // Kayıt başarılı, kullanıcıyı giriş ekranına yönlendirin veya gerekli işlemleri yapın.
      } catch (e) {
        print(e.toString());
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Tebrikler"),
          content:
              Text(' $email kullanıcı adı ile Stupet hesabı oluşturdunuz.'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
                // İstenilen bir sayfaya yönlendirme yapabilirsiniz.
              },
            ),
          ],
        );
      },
    );
  }
}
