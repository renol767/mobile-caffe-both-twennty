import 'dart:math';

import 'package:caffe_both_twenty/cubit/cubit.dart';
import 'package:caffe_both_twenty/cubit/transaction_cubit.dart';
import 'package:caffe_both_twenty/models/fetchuser.dart';
import 'package:caffe_both_twenty/models/food_model.dart';
import 'package:caffe_both_twenty/models/transaction.dart';
import 'package:caffe_both_twenty/page/page_dashboard/menu/payment_page.dart';
import 'package:caffe_both_twenty/services/user_services.dart';
import 'package:caffe_both_twenty/widgets/rating_stars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';

class FoodDetailPage extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;

  FoodDetailPage({this.onBackButtonPressed, this.transaction});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  UserService get usersService => GetIt.I<UserService>();
  FetchUser users;

  @override
  void initState() {
    super.initState();
    usersService
        .getFetchuser(FirebaseAuth.instance.currentUser.uid)
        .then((value) {
      users = value;
    });
  }

  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://192.168.1.10/caffe-booth-twenty/gambar/" +
                                  widget.transaction.food.picturePath),
                          fit: BoxFit.cover)))),
          SafeArea(
              child: ListView(
            children: [
              Column(
                children: [
                  //// Back Button
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          if (widget.onBackButtonPressed != null) {
                            widget.onBackButtonPressed();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //// Body
                  Container(
                    margin: EdgeInsets.only(top: 150),
                    padding: EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 134,
                                  child: Text(
                                    widget.transaction.food.name,
                                    style: TextStyle(
                                        color: Color(0xfffd6f19),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                (widget.transaction.food.rate == 0)
                                    ? Text("No Rating Avalibe",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade600))
                                    : RatingStars(widget.transaction.food.rate)
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity = max(1, quantity - 1);
                                    });
                                  },
                                  child: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 1, color: Color(0xfffd6f19)),
                                    ),
                                    child: Icon(
                                      Icons.horizontal_rule,
                                      color: Color(0xfffd6f19),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: 50,
                                    child: Text(
                                      quantity.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xfffd6f19),
                                          fontSize: 18),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = min(999, quantity + 1);
                                      });
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 1, color: Color(0xfffd6f19)),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xfffd6f19),
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                          child: Text(
                            widget.transaction.food.description,
                            style: TextStyle(
                                color: Color(0xfffd6f19), fontSize: 15),
                          ),
                        ),
                        Text('Ingredients',
                            style: TextStyle(
                                color: Color(0xfffd6f19),
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 4, 0, 41),
                          child: Text(widget.transaction.food.ingredients,
                              style: TextStyle(
                                  color: Color(0xfffd6f19), fontSize: 15)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Price',
                                  style: TextStyle(
                                      color: Color(0xfffd6f19), fontSize: 15),
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'IDR',
                                          decimalDigits: 0)
                                      .format(quantity *
                                          widget.transaction.food.price),
                                  style: TextStyle(
                                      color: Color(0xfffd6f19),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 163,
                              height: 45,
                              child: RaisedButton(
                                onPressed: () {
                                  Get.to(() => PaymentPage(
                                      nama: users.firstName +
                                          " " +
                                          users.lastName,
                                      alamat: users.address,
                                      wa: users.numberwhatsapp,
                                      transaction: Transaction(
                                        food: widget.transaction.food,
                                        quantity: quantity,
                                        total: quantity *
                                            widget.transaction.food.price,
                                      )));
                                },
                                color: Color(0xfffd6f19),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  'Order Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
