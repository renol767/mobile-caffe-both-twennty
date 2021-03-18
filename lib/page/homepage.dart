import 'package:caffe_both_twenty/page/login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 120,
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
            SizedBox(
              height: 50,
            ),
            Container(
                padding: EdgeInsets.all(30),
                child: Image.asset('images/homescreen.png',
                    height: 300, width: 300)),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffff38f1), Color(0xffba00ff)],
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
    );
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
