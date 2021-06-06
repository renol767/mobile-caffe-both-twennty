import 'package:caffe_both_twenty/models/news_model.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatefulWidget {
  final News news;
  NewsDetailPage({this.news});

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                Icons.arrow_back_ios,
                color: Color(0xfffd6f19),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.orange,
              ),
              SafeArea(
                  child: Container(
                color: Colors.white,
              )),
              SafeArea(
                  child: Container(
                      margin: EdgeInsets.only(right: 16, left: 16),
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "http://192.168.1.10/caffe-booth-twenty/gambar/" +
                                      widget.news.picture),
                              fit: BoxFit.contain)))),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      widget.news.title,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      widget.news.description,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
