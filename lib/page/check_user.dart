import 'dart:convert';
import 'package:caffe_both_twenty/page/home.dart';
import 'package:caffe_both_twenty/page/info_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/user.dart';

class CheckUser extends StatefulWidget {
  @override
  _CheckUserState createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitFadingCube(color: Color(0xfffd6f19)),
              SizedBox(height: 20),
              Text("Check User Data...")
            ],
          ),
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser.uid;
    if (mounted) {
      setState(() {
        getUser();
      });
    }
  }

  String uid;
  Future<CheckUser> getUser() async {
    final token = "0a66838fcbd880483b9af2c91c6cef9e";
    final url =
        "http://192.168.1.6/caffe-booth-twenty/api/infodata?uid=$uid&Token=$token";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => InfoUser()));
    }
  }
}
