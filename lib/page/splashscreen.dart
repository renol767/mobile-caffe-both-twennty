import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseMessaging fm = FirebaseMessaging();
  @override
  void initState() {
    fm.getToken().then((value) => print("token : $value"));
    fm.configure(onMessage: (message) async {
      fm.requestNotificationPermissions(
          const IosNotificationSettings(sound: true, badge: true, alert: true));
      print(message);
    }, onLaunch: (message) async {
      print(message);
    }, onResume: (message) async {
      print(message);
    });
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: MyHomePage(),
                  inheritTheme: true,
                  duration: Duration(milliseconds: 1000),
                  reverseDuration: Duration(milliseconds: 1000),
                  ctx: context),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/Logo.png',
            height: 200,
            width: 300,
          ),
          SizedBox(height: 80.0),
          SpinKitFadingCube(color: Color(0xfffd6f19))
        ],
      ),
    );
  }
}
