import 'dart:convert';
import 'package:caffe_both_twenty/models/user.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:caffe_both_twenty/page/home.dart';
import 'package:caffe_both_twenty/page/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/usermodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InfoUser extends StatefulWidget {
  @override
  _InfoUserState createState() => _InfoUserState();
}

final _token = "0a66838fcbd880483b9af2c91c6cef9e";

class _InfoUserState extends State<InfoUser> {
  Future<UserModel> createUser(
      String uid,
      String firstname,
      String lastname,
      String email,
      String address,
      String numberphone,
      String numberwhatsapp,
      String Token) async {
    final String apiURL = "http://192.168.1.9/caffe-booth-twenty/api/infodata";
    final response = await http.post(apiURL, body: {
      "uid": uid,
      "first_name": firstname,
      "last_name": lastname,
      "email": email,
      "address": address,
      "numberphone": numberphone,
      "numberwhatsapp": numberwhatsapp,
      "Token": Token
    });

    if (response.statusCode == 200) {
      var responseString = json.decode(response.body);

      return UserModel.fromJson(responseString);
    } else {
      return null;
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _firstname;
  String _email;
  String _numberphone;
  String _numberwhatsapp;

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
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
        body: WillPopScope(
          onWillPop: onWillPop,
          child: SingleChildScrollView(
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
                    Visibility(
                        visible: false,
                        child: TextField(
                          controller: _uidController,
                          enabled: false,
                        )),
                    SizedBox(
                      height: 16,
                    ),
                    Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: validateName,
                            onSaved: (String val) {
                              _firstname = val;
                            },
                            controller: _firstnameController,
                            decoration: InputDecoration(
                              labelText: "First Name",
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0xffe92b05)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0xffe92b05)),
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
                              labelText: "Last Name (Optional)",
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0xffe92b05)),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            validator: validateEmail,
                            onSaved: (String val) {
                              _email = val;
                            },
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0xffe92b05)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0xffe92b05)),
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
                              labelText: "Address (Optional)",
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0xffe92b05)),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            validator: validatePhoneNumber,
                            onSaved: (String val) {
                              _numberphone = val;
                            },
                            maxLength: 15,
                            controller: _numberphoneController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterStyle: TextStyle(color: Color(0xffe92b05)),
                              labelText: "Phone Number",
                              hintText: "8123456789",
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0xffe92b05)),
                              ),
                              prefix: Padding(
                                padding: EdgeInsets.all(4),
                                child: Text("+62 "),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0xffe92b05)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            validator: validateWhatsappNumber,
                            onSaved: (String val) {
                              _numberwhatsapp = val;
                            },
                            maxLength: 15,
                            controller: _numberwhatsappController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterStyle: TextStyle(color: Color(0xffe92b05)),
                              labelText: "Whatsapp Number",
                              hintText: "8123456789",
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0xffe92b05)),
                              ),
                              prefix: Padding(
                                padding: EdgeInsets.all(4),
                                child: Text("+62 "),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0xffe92b05)),
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
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  final UserModel user = await createUser(
                                      _uidController.text,
                                      _firstnameController.text,
                                      _lastnameController.text,
                                      _emailController.text,
                                      _addressController.text,
                                      '+62${_numberphoneController.text}',
                                      '+62${_numberwhatsappController.text}',
                                      _token);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                } else {
                                  setState(() {
                                    _autoValidate = true;
                                  });
                                }
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
                                    colors: [
                                      Color(0xfffdaa19),
                                      Color(0xffe92b05)
                                    ],
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
                            height: 250,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  String validateName(String value) {
    if (value.isEmpty)
      return 'First Name Tidak Boleh Kosong';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePhoneNumber(String value) {
    if (value.isEmpty)
      return 'Phone Number Tidak Boleh Kosong';
    else
      return null;
  }

  String validateWhatsappNumber(String value) {
    if (value.isEmpty)
      return 'Whatsapp Number Tidak Boleh Kosong';
    else
      return null;
  }

  DateTime currentBackPressTime;
  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Tekan Lagi Untuk Keluar");
      return Future.value(false);
    }
    SystemNavigator.pop();
    await FirebaseAuth.instance.signOut();
    return Future.value(true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = FirebaseAuth.instance.currentUser.uid;
    numberphone = FirebaseAuth.instance.currentUser.phoneNumber.substring(3);
    _numberphoneController.text = numberphone;
  }
}
