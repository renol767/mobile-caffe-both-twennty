import 'package:caffe_both_twenty/models/food_model.dart';
import 'package:caffe_both_twenty/widgets/rating_stars.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  FoodCard(this.food);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: 200,
        height: 210,
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
                      image: NetworkImage(food.picturePath),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.all(8),
              width: 200,
              child: Text(
                food.name,
                style: TextStyle(
                    color: Color(0xfffd6f19),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 8), child: RatingStars(food.rate))
          ],
        ),
      ),
    );
  }
}
