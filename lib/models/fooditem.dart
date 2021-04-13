import 'package:flutter/foundation.dart';

FooditemList fooditemList = FooditemList(foodItems: [
  FoodItem(
    id: 1,
    title: "Beach BBQ Burger",
    desc: "Las Vegas Hotel",
    price: 14.49,
    imgUrl:
        "https://www.sgs.co.id/-/media/global/images/structural-website-images/hero-images/hero-agri-appetizers.jpg",
  ),
  FoodItem(
    id: 2,
    title: "Kick Ass Burgers",
    desc: "Dudleys",
    price: 11.99,
    imgUrl:
        "https://www.dashef.com/wp-content/uploads/2016/11/Depositphotos_71652087_original-min.jpg",
  ),
  FoodItem(
    id: 3,
    title: "Supreme Pizza Burger",
    desc: "Golf Course",
    price: 8.49,
    imgUrl:
        "https://www.blibli.com/friends/assets/2020/11/food-photography-2610863_1920.jpg",
  ),
  FoodItem(
    id: 4,
    title: "Chilly Cheeze Burger",
    desc: "Las Vegas Hotel",
    price: 14.49,
    imgUrl:
        "https://lh3.googleusercontent.com/proxy/2xHIW-XoBSfeQ1VyWC5tKd5h_fhqj4xMktXstAzKhwA1r0DKI2tVYPnNjMZZ4lv2XduhdhyXEnKPtrG-oxS4kfL4_JvhVnJFouPzzcvDjcEuaRR-2H4xrjaszTEG_YTTK4aTSxnxsB2WoNgAD3B8",
  ),
  FoodItem(
    id: 5,
    title: "Beach BBQ Burger",
    desc: "Las Vegas Hotel",
    price: 14.49,
    imgUrl:
        "https://www.herrytjiang.com/wp-content/uploads/2016/08/my-warm-day-herry-tjiang-3.jpg",
  )
]);

class FooditemList {
  List<FoodItem> foodItems;

  FooditemList({@required this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String desc;
  double price;
  String imgUrl;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.desc,
    @required this.price,
    @required this.imgUrl,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}
