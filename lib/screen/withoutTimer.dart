import 'package:flutter/material.dart';
import 'dart:async';
import 'package:stupet/screen/withoutRegister.dart';
import '../components/customAppBar.dart';

class WithoutTimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountdownPage(),
    );
  }
}

class CountdownPage extends StatefulWidget {
  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  late Timer _timer;
  DateTime _tytDate = DateTime(2024, 06, 22);
  DateTime _aytDate = DateTime(2024, 06, 23);

  int _tytdays = 0;
  int _tythours = 0;
  int _tytminutes = 0;
  int _tytseconds = 0;

  int _aytdays = 0;
  int _aythours = 0;
  int _aytminutes = 0;
  int _aytseconds = 0;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final tyt = _tytDate.difference(now);
      final ayt = _aytDate.difference(now);

      setState(() {
        _tytdays = tyt.inDays;
        _tythours = tyt.inHours.remainder(24);
        _tytminutes = tyt.inMinutes.remainder(60);
        _tytseconds = tyt.inSeconds.remainder(60);

        _aytdays = ayt.inDays;
        _aythours = ayt.inHours.remainder(24);
        _aytminutes = ayt.inMinutes.remainder(60);
        _aytseconds = ayt.inSeconds.remainder(60);
      });

      if (tyt.isNegative && ayt.isNegative) {
        _timer.cancel();
        print('Sınav Günü');
      }
    });
  }

  Widget _buildFlipDigit(int value) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(51, 51, 51, 51).withOpacity(0.35),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value.toString().padLeft(2, '0'),
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCountdownWidget(String title, int days, int hours, int minutes,
      int seconds, IconData iconData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
          child: Row(
            children: [
              Icon(
                iconData,
                color: Colors.black87,
                size: 20.0,
              ),
              SizedBox(width: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildFlipDigit(days),
            _buildFlipDigit(hours),
            _buildFlipDigit(minutes),
            _buildFlipDigit(seconds),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Gün',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Saat',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Dakika',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Saniye',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "Geri Sayım",
        onBackButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WithoutRegister(),
            ),
          );
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white30.withOpacity(0.45),
              BlendMode.darken,
            ),
          ),
        ),
        child: SizedBox(
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCountdownWidget('TYT 2024:', _tytdays, _tythours,
                  _tytminutes, _tytseconds, Icons.timer_outlined),
              SizedBox(height: 70),
              _buildCountdownWidget('AYT 2024:', _aytdays, _aythours,
                  _aytminutes, _aytseconds, Icons.timer_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
