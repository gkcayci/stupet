import 'package:stupet/color/color_theme.dart';
import 'package:stupet/screen/homePage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;
  late Animation<double> _nameAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    _logoAnimation = Tween<double>(begin: 1.0, end: 0.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.9),
      ),
    );

    _nameAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.8, 1),
      ),
    );

    _controller.forward().whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(), // anasayfaya gidiyor
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorTheme().backgroundColor,
        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: ColorTheme().backgroundColor,
                ),
                Opacity(
                  opacity: _logoAnimation.value,
                  child: Container(
                    child: Image.asset(
                      'assets/icon.png',
                      height: 500 * _logoAnimation.value,
                    ),
                  ),
                ),
                Opacity(
                  opacity: _nameAnimation.value,
                  child: Transform.scale(
                    scale: _nameAnimation.value,
                    child: Container(
                      child: Image.asset(
                        'assets/logo1.png',
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
