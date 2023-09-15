import 'package:flutter/material.dart';
import 'package:stupet/color/color_theme.dart';
import 'dart:async';

import 'package:stupet/components/customAppBar.dart';
import 'package:stupet/screen/homePage.dart';

class PomodoroPage extends StatefulWidget {
  @override
  _PomodoroPageState createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  final List<int> durations = [25, 30, 45, 60];
  int selectedDuration = 25;
  bool isRunning = false;
  bool isPaused = false;
  late Timer timer;
  int secondsRemaining = 0;

  void startTimer() {
    if (!isRunning) {
      isRunning = true;
      if (secondsRemaining == 0) {
        secondsRemaining = selectedDuration * 60;
      }

      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (secondsRemaining > 0 && !isPaused) {
          setState(() {
            secondsRemaining--;
          });
        } else if (secondsRemaining == 0) {
          stopTimer();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Pomodoro Tamamlandı'),
              content: Text('Süre doldu.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Tamam'),
                ),
              ],
            ),
          );
        }
      });
    }
  }

  void stopTimer() {
    if (isRunning) {
      isRunning = false;
      isPaused = false;
      timer.cancel();
    }
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      secondsRemaining = selectedDuration * 60;
    });
  }

  void pauseTimer() {
    if (isRunning) {
      setState(() {
        isPaused = !isPaused;
      });

      if (isPaused) {
        stopTimer();
      } else {
        startTimer();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // title: "Pomodoro",
        onBackButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/background.png"),
        //     fit: BoxFit.cover,
        //     colorFilter: ColorFilter.mode(
        //       ColorTheme().darkGray.withOpacity(0.1),
        //       BlendMode.darken,
        //     ),
        //   ),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<int>(
                  value: selectedDuration,
                  items: durations.map((duration) {
                    return DropdownMenuItem<int>(
                      value: duration,
                      child: Text(
                        '$duration dakika',
                        style: TextStyle(fontSize: 25),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDuration = value!;
                      resetTimer();
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 200.0),
                    child: Container(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        value: secondsRemaining / (selectedDuration * 60),
                        strokeWidth: 15,
                        color: ColorTheme().yellow,
                        backgroundColor: ColorTheme().darkGray,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 130.0),
                        child: Text(
                          '${(secondsRemaining ~/ 60).toString().padLeft(2, '0')}:${(secondsRemaining % 60).toString().padLeft(2, '0')}',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: isRunning ? pauseTimer : startTimer,
                            child: Text(
                                isRunning && !isPaused ? 'Duraklat' : 'Başlat'),
                            style: ElevatedButton.styleFrom(
                              primary: isRunning
                                  ? isPaused
                                      ? ColorTheme().yellow
                                      : ColorTheme().darkGray
                                  : ColorTheme().yellow,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              minimumSize: Size(100, 50),
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: resetTimer,
                            child: Text('Sıfırla'),
                            style: ElevatedButton.styleFrom(
                              primary: ColorTheme().darkGray,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              minimumSize: Size(100, 50),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
