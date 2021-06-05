import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Booth Twenty",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfffd6f19)),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Caffe & Resto",
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'images/Logo.png',
                      height: 200,
                      width: 300,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        Text(
                            "Caffe Both Twenty adalah sebuah caffe dan resto yang terletak di daerah lohbener Indramayu. Caffe ini menyediakan berbagai makanan minuman yang pastinya enak dan murah karena caffe ini dibangun untuk para mahasiswa yang ingin nongkrong atau mengerjakan tugas sambil menikmati hidangan minuman dari caffe kami.")
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}
