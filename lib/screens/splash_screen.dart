import 'dart:async';
import 'package:flutter/material.dart';
import 'introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName ='SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer for 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => IntroductionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2FEFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image(image: AssetImage('assets/images/splash.png')),
            Spacer(),
            Image(image: AssetImage('assets/images/pranding.png'),),
          ],
        ),
      ),
    );
  }
}