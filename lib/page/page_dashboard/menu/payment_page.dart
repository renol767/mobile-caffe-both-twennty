import 'package:caffe_both_twenty/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentPage extends StatelessWidget {
  final Transaction transaction;

  PaymentPage({this.transaction});

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
                                      margin: EdgeInsets.only(right: 12),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  transaction.food.picturePath),
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
                                            transaction.food.name,
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
                                            transaction.food.price,
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
                                  '${transaction.quantity} items',
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
                                    transaction.food.name,
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
                                        .format(transaction.total),
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
                                        .format(transaction.quantity *
                                            transaction.food.price),
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
                                      transaction.user.firstName +
                                          ' ' +
                                          transaction.user.lastName,
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
                                  transaction.user.address,
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
                                  transaction.user.numberwhatsapp,
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
                      Container(
                        height: 50,
                        child: FlatButton(
                          onPressed: () {},
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
                                  minHeight: 50, maxWidth: double.infinity),
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
