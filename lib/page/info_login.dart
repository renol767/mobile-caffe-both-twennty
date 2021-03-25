import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:caffe_both_twenty/page/home.dart';
import 'package:caffe_both_twenty/page/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/usermodel.dart';

class InfoUser extends StatefulWidget {
  @override
  _InfoUserState createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  Future<UserModel> createUser(
      String uid,
      String firstname,
      String lastname,
      String email,
      String address,
      String numberphone,
      String numberwhatsapp) async {
    final String apiURL =
        "https://0ba28d60f15343b797e43f64a5a4258a.000webhostapp.com/api/user";
    final response = await http.post(apiURL, body: {
      "uid": uid,
      "first_name": firstname,
      "last_name": lastname,
      "email": email,
      "address": address,
      "numberphone": numberphone,
      "numberwhatsapp": numberwhatsapp
    });

    if (response.statusCode == 200) {
      var responseString = json.decode(response.body);

      return UserModel.fromJson(responseString);
    } else {
      return null;
    }
  }

  TextEditingController _uidController = new TextEditingController();
  TextEditingController _firstnameController = new TextEditingController();
  TextEditingController _lastnameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  TextEditingController _numberphoneController = new TextEditingController();
  TextEditingController _numberwhatsappController = new TextEditingController();
  String uid, numberphone;
  // UserDetail user = null;
  @override
  Widget build(BuildContext context) {
    _uidController.text = uid;
    String _user;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.all(5),
            width: 50,
            height: 50,
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Create Info Account",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Create Info",
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _uidController,
                    decoration: InputDecoration(
                      enabled: false,
                      labelText: uid,
                      labelStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: <Widget>[
                      TextField(
                        controller: _firstnameController,
                        decoration: InputDecoration(
                          labelText: "First Name",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.purple.shade300),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: _lastnameController,
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.purple.shade300),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.purple.shade300),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText: "Address",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.purple.shade300),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _numberphoneController,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.purple.shade300),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: _numberwhatsappController,
                        decoration: InputDecoration(
                          labelText: "Whatsapp Number",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.purple.shade300),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        child: FlatButton(
                          onPressed: () async {
                            final UserModel user = await createUser(
                                _uidController.text,
                                _firstnameController.text,
                                _lastnameController.text,
                                _emailController.text,
                                _addressController.text,
                                _numberphoneController.text,
                                _numberwhatsappController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xffff38f1), Color(0xffba00ff)],
                                stops: [0, 1],
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(
                                  minHeight: 50, maxWidth: double.infinity),
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 300,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = FirebaseAuth.instance.currentUser.uid;
    numberphone = FirebaseAuth.instance.currentUser.phoneNumber;
  }
}
