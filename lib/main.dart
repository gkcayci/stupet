import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stupet/screen/onboardingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selected = "0";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bootcamp F-33',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: OnboardingScreen(),
      ),
    );
  }
}
