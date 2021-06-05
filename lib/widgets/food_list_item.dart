import 'package:caffe_both_twenty/models/food_model.dart';
import 'package:caffe_both_twenty/widgets/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final double itemWidth;

  FoodListItem({@required this.food, @required this.itemWidth});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(
                      "http://192.168.1.9/caffe-booth-twenty/gambar/" +
                          food.picturePath),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name,
                style: TextStyle(
                    color: Color(0xfffd6f19),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                NumberFormat.currency(
                        symbol: "IDR ", decimalDigits: 0, locale: "id-ID")
                    .format(food.price),
                style: TextStyle(color: Color(0xfffd6f19), fontSize: 13),
              )
            ],
          ),
        ),
        (food.rate == 0)
            ? Text("No Rating Avalibe",
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600))
            : RatingStars(food.rate)
      ],
    );
  }
}
