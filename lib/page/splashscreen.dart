import 'dart:async';
import 'homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            'https://i.pinimg.com/originals/22/29/ab/2229ab619400f9e376604b98249a8eda.jpg',
            height: 200,
            width: 300,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace stackTrace) {
              return Text('Your error widget...');
            },
          ),
          SizedBox(height: 30.0),
          SpinKitFadingCube(color: Colors.lightBlueAccent)
        ],
      ),
    );
  }
}
