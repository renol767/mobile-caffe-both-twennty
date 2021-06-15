import 'package:caffe_both_twenty/models/food_model.dart';
import 'package:caffe_both_twenty/models/news_model.dart';
import 'package:caffe_both_twenty/widgets/rating_stars.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final News news;

  NewsCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: 280,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  image: DecorationImage(
                      image: NetworkImage(
                          "http://192.168.1.6/caffe-booth-twenty/gambar/" +
                              news.picture),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, right: 50),
              width: 200,
              child: Text(
                news.title,
                style: TextStyle(
                    color: Color(0xfffd6f19),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
