import 'package:flutter/material.dart';
import 'otp.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Image.network(
              'https://i.pinimg.com/originals/22/29/ab/2229ab619400f9e376604b98249a8eda.jpg',
              height: 200,
              width: 300,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace stackTrace) {
                return Text('Your error widget...');
              },
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Colors.grey.withOpacity(0.3),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Enter Number Phone',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: TextField(
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        decoration: InputDecoration(
                            hintText: "Enter Number Phone",
                            border: InputBorder.none,
                            prefix: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text("+62 "),
                            )),
                        controller: _controller,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xffff38f1), Color(0xffba00ff)],
                            stops: [0, 1],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: OTPScreen(_controller.text),
                                inheritTheme: true,
                                duration: Duration(milliseconds: 1000),
                                reverseDuration: Duration(milliseconds: 1000),
                                ctx: context),
                          );
                        },
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
