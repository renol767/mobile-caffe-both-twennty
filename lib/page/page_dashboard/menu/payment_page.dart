import 'package:caffe_both_twenty/cubit/cubit.dart';
import 'package:caffe_both_twenty/models/fetchuser.dart';
import 'package:caffe_both_twenty/models/sendtransaction.dart';
import 'package:caffe_both_twenty/models/transaction.dart';
import 'package:caffe_both_twenty/page/home.dart';
import 'package:caffe_both_twenty/page/page_dashboard/order.dart';
import 'package:caffe_both_twenty/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'food_detail_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  PaymentPage({this.transaction});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;

  UserService get usersService => GetIt.I<UserService>();

  FetchUser users;

  final _token = "0a66838fcbd880483b9af2c91c6cef9e";
  String _uid;

  Future<SendTransaction> createTransaction(
      String id,
      String uid,
      String foodId,
      String quantity,
      String total,
      String status,
      String Token) async {
    final String apiURL =
        "http://192.168.1.11/caffe-booth-twenty/api/transaction?Token=$_token";
    final response = await http.post(apiURL, body: {
      'id': id,
      'uid': uid,
      'food_id': foodId,
      'quantity': quantity,
      'total': total,
      'status': status,
      "Token": Token
    });
    if (response.statusCode == 200) {
      var responseString = json.decode(response.body);

      return SendTransaction.fromJson(responseString);
    } else {
      return null;
    }
  }

  @override
  void initState() {
    usersService
        .getFetchuser(FirebaseAuth.instance.currentUser.uid)
        .then((value) {
      users = value;
    });
    _uid = FirebaseAuth.instance.currentUser.uid;
  }

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
            child: Container(
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Payment",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0xfffd6f19)),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Pembayaran",
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.only(top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Item Ordered',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xfffd6f19),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              image: NetworkImage(widget
                                                  .transaction
                                                  .food
                                                  .picturePath),
                                              fit: BoxFit.cover)),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              2 * 16 -
                                              60 -
                                              12 -
                                              78,
                                          child: Text(
                                            widget.transaction.food.name,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xfffd6f19),
                                                fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          NumberFormat.currency(
                                                  locale: 'id-ID',
                                                  symbol: 'IDR ',
                                                  decimalDigits: 0)
                                              .format(
                                            widget.transaction.food.price,
                                          ),
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey.shade700),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                  '${widget.transaction.quantity} items',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                'Details Transaction',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xfffd6f19),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      16 -
                                      5,
                                  child: Text(
                                    widget.transaction.food.name,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey.shade700),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      16 -
                                      27,
                                  child: Text(
                                    NumberFormat.currency(
                                            locale: 'id-ID',
                                            symbol: 'IDR ',
                                            decimalDigits: 0)
                                        .format(widget.transaction.total),
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      16 -
                                      5,
                                  child: Text(
                                    'Total Harga',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xfffd6f19),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      16 -
                                      27,
                                  child: Text(
                                    NumberFormat.currency(
                                            locale: 'id-ID',
                                            symbol: 'IDR ',
                                            decimalDigits: 0)
                                        .format(widget.transaction.total),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xfffd6f19),
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        padding: EdgeInsets.only(top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deliver to',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xfffd6f19),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 80,
                                    child: Text(
                                      'Name',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade700,
                                      ),
                                    )),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        2 * 16 -
                                        80 -
                                        64,
                                    child: Text(
                                      "Renol Nindi Kara",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.right,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Address',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Text(
                                  'Majalengka',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.right,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Whatsapp',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Text(
                                  "+62123456789",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.right,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      (isLoading)
                          ? SpinKitFadingCube(
                              color: Color(0xfffd6f19),
                              size: 30,
                            )
                          : Container(
                              height: 50,
                              child: RaisedButton(
                                onPressed: () async {
                                  final SendTransaction transaction =
                                      await createTransaction(
                                          " ",
                                          _uid,
                                          widget.transaction.food.id.toString(),
                                          widget.transaction.quantity
                                              .toString(),
                                          widget.transaction.total.toString(),
                                          "Belum Bayar",
                                          _token);
                                  // await createTransaction(
                                  //     "",
                                  //     _uid,
                                  //     widget.transaction.food.id,
                                  //     widget.transaction.quantity
                                  //         .toString(),
                                  //     widget.transaction.total.toString(),
                                  //     "Belum Bayar");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                  // setState(() {
                                  //   isLoading = true;
                                  // });
                                  // bool result = await context
                                  //     .bloc<TransactionCubit>()
                                  //     .submitTransaction(widget.transaction
                                  //         .copyWith(
                                  //             dateTime: DateTime.now(),
                                  //             total: widget.transaction.total
                                  //                 .toInt()));

                                  // if (result == true) {
                                  //   Get.to(() => Order());
                                  // } else {
                                  //   setState(() {
                                  //     isLoading = false;
                                  //   });
                                  //   Fluttertoast.showToast(
                                  //       msg: "Transaction Failed");
                                  // }
                                },
                                padding: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: Color(0xfffd6f19),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    constraints: BoxConstraints(
                                        minHeight: 50,
                                        maxWidth: double.infinity),
                                    child: Text(
                                      "Checkout Now",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ]))));
  }
}
