import 'package:caffe_both_twenty/models/usermodel.dart';
import 'package:caffe_both_twenty/models/fetchuser.dart';
import 'package:caffe_both_twenty/page/check_user.dart';
import 'package:caffe_both_twenty/page/home.dart';
import 'package:caffe_both_twenty/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  UserService get usersService => GetIt.I<UserService>();
  FetchUser users;
  void initState() {
    super.initState();
    if (this.mounted) {
      usersService
          .getFetchuser(FirebaseAuth.instance.currentUser.uid)
          .then((value) {
        users = value;
        _firstnameController.text = users.firstName;
        _lastnameController.text = users.lastName;
        _emailController.text = users.email;
        _addressController.text = users.address;
        _numberphoneController.text = users.numberphone.substring(3);
        _numberwhatsappController.text = users.numberwhatsapp.substring(3);
      });
    }
    uid = FirebaseAuth.instance.currentUser.uid;
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _firstname, _email, _numberphone, _numberwhatsapp, uid;
  final _token = "0a66838fcbd880483b9af2c91c6cef9e";

  Future<UserModel> updateUser(
      String uid,
      String firstname,
      String lastname,
      String email,
      String address,
      String numberphone,
      String numberwhatsapp,
      String Token) async {
    final String apiURL = "http://192.168.1.15/caffe-booth-twenty/api/infodata";
    final response = await http.put(apiURL, body: {
      "uid": uid,
      "first_name": firstname,
      "last_name": lastname,
      "email": email,
      "address": address,
      "numberphone": numberphone,
      "numberwhatsapp": numberwhatsapp,
      "Token": Token,
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

  @override
  Widget build(BuildContext context) {
    _uidController.text = uid;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.all(5),
          width: 50,
          height: 50,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xfffd6f19),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Profile",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfffd6f19)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Edit Info Account",
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade400),
                    ),
                  ],
                ),
                Visibility(
                    visible: false,
                    child: TextField(
                      controller: _uidController,
                      enabled: false,
                    )),
                SizedBox(
                  height: 30.0,
                ),
                Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Column(
                    children: [
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
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffe92b05)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffe92b05)),
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
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffe92b05)),
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
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffe92b05)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffe92b05)),
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
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffe92b05)),
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
                              borderSide: BorderSide(color: Color(0xffe92b05)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffe92b05)),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            prefix: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text("+62 "),
                            )),
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
                              borderSide: BorderSide(color: Color(0xffe92b05)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffe92b05)),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            prefix: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text("+62 "),
                            )),
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
                              final UserModel user = await updateUser(
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
                              Fluttertoast.showToast(
                                  msg: "Success Update Data");
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
                                colors: [Color(0xfffdaa19), Color(0xffe92b05)],
                                stops: [0, 1],
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(
                                  minHeight: 50, maxWidth: double.infinity),
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
