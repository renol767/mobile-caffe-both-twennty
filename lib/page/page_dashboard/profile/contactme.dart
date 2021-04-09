import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactMe extends StatefulWidget {
  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  _launchURL(String url, String errmsg) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      Fluttertoast.showToast(msg: errmsg);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hubungi Kami",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffd6f19)),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Jika Ada Pertanyaan",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              FlatButton(
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                textColor: Color(0xfffd6f19),
                color: Colors.grey.shade200,
                onPressed: () {
                  _launchURL("https://wa.me/+6285156816197?text=Hallo",
                      "Error Open Whatsapp");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FaIcon(
                        FontAwesomeIcons.whatsapp,
                        size: 17,
                        color: Color(0xfffd6f19),
                      ),
                    ),
                    Text(
                      'Hubungi Via Whatsapp',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                textColor: Color(0xfffd6f19),
                height: 50.0,
                color: Colors.grey.shade200,
                onPressed: () {
                  _launchURL("https://instagram.com/renolakatsuki",
                      "Error Open Instagram");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FaIcon(
                        FontAwesomeIcons.instagramSquare,
                        size: 17,
                        color: Color(0xfffd6f19),
                      ),
                    ),
                    Text(
                      'Hubungi Via Instagram',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
