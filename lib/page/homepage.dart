import 'dart:io';

import 'package:caffe_both_twenty/page/home.dart';
import 'package:caffe_both_twenty/page/login.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: WillPopScope(
            onWillPop: onWillPop,
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(30),
                          child: Image.asset('images/homescreen.png',
                              height: 400, width: 400)),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xfffdaa19), Color(0xffe92b05)],
                            stops: [0, 1],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: InkWell(
                          onTap: _login,
                          child: Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  DateTime currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Tekan Lagi Untuk Keluar");
      return Future.value(false);
    }
    SystemNavigator.pop();
    return Future.value(true);
  }

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        print("User Log Out");
      }
    });
  }

  void _login() {
    Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          child: LoginScreen(),
          inheritTheme: true,
          duration: Duration(milliseconds: 1000),
          reverseDuration: Duration(milliseconds: 1000),
          ctx: context),
    );
  }
}
