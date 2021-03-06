import 'package:caffe_both_twenty/page/login.dart';
import 'package:caffe_both_twenty/page/page_dashboard/profile/about.dart';
import 'package:caffe_both_twenty/page/page_dashboard/profile/contactme.dart';
import 'package:caffe_both_twenty/page/page_dashboard/profile/howtoorder.dart';
import 'package:caffe_both_twenty/page/page_dashboard/profile/update_profil.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  _launchURL(String url, String errmsg) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      Fluttertoast.showToast(msg: errmsg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Others",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfffd6f19)),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textColor: Color(0xfffd6f19),
                      height: 50.0,
                      color: Colors.grey.shade200,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateProfile()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FaIcon(
                              FontAwesomeIcons.solidUser,
                              size: 17,
                              color: Color(0xfffd6f19),
                            ),
                          ),
                          Text(
                            'Profile',
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textColor: Color(0xfffd6f19),
                      height: 50.0,
                      color: Colors.grey.shade200,
                      onPressed: () {
                        _launchURL(
                            "https://www.google.com/maps/place/Booth+Twenty+cafe+%26+resto/@-6.3971334,108.2842332,15z/data=!4m2!3m1!1s0x0:0xc1fb5c60196d1a5f?sa=X&ved=2ahUKEwiultHXtOzvAhXCeisKHe-9BgwQ_BIwE3oECCIQBQ",
                            "Error Open Google Maps");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FaIcon(
                              FontAwesomeIcons.directions,
                              size: 17,
                              color: Color(0xfffd6f19),
                            ),
                          ),
                          Text(
                            'Get Directions',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textColor: Color(0xfffd6f19),
                      height: 50.0,
                      color: Colors.grey.shade200,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => About()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FaIcon(
                              FontAwesomeIcons.infoCircle,
                              size: 17,
                              color: Color(0xfffd6f19),
                            ),
                          ),
                          Text(
                            'Tentang',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textColor: Color(0xfffd6f19),
                      height: 50.0,
                      color: Colors.grey.shade200,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HowToOrder()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FaIcon(
                              FontAwesomeIcons.solidQuestionCircle,
                              size: 17,
                              color: Color(0xfffd6f19),
                            ),
                          ),
                          Text(
                            'Cara Order',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textColor: Color(0xfffd6f19),
                      height: 50.0,
                      color: Colors.grey.shade200,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactMe()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FaIcon(
                              FontAwesomeIcons.solidComment,
                              size: 17,
                              color: Color(0xfffd6f19),
                            ),
                          ),
                          Text(
                            'Hubungi Kami',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textColor: Colors.white,
                      height: 50.0,
                      color: Color(0xfffd6f19),
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (route) => false);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FaIcon(
                              FontAwesomeIcons.signOutAlt,
                              size: 17,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Log Out',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
