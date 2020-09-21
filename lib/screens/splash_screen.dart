import 'package:flutter/material.dart';
import 'dart:async';

import 'package:homebrew_sum2/screens/choose_device_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ChooseDeviceScreen()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "HOMEBREW",
              style: TextStyle(
                  fontSize: 50, fontFamily: "Norwester", color: Colors.white),
            ),
            Text(
              "Great Coffee at Home",
              style: TextStyle(fontFamily: "Kollektiff", color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
