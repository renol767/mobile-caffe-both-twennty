import 'package:caffe_both_twenty/models/food_model.dart';
import 'package:caffe_both_twenty/models/transaction.dart';
import 'package:caffe_both_twenty/widgets/custom_tabbar.dart';
import 'package:caffe_both_twenty/widgets/order_list_item.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int selectedIndex = 0;
  List<Transaction> progress = mockTransactions
      .where((element) => element.status == TransactionStatus.belumbayar)
      .toList();
  List<Transaction> past = mockTransactions
      .where((element) =>
          element.status == TransactionStatus.sudahdibayar ||
          element.status == TransactionStatus.cancelled)
      .toList();
  @override
  Widget build(BuildContext context) {
    double listitemWidth = MediaQuery.of(context).size.width - 2 * 16;
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Orders",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xfffd6f19)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  CustomTabbar(
                      selectedIndex: selectedIndex,
                      titles: ['Progress', 'Complete'],
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      }),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                      children: (selectedIndex == 0 ? progress : past)
                          .map((e) => Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, bottom: 16),
                              child: OrderListItem(
                                  transaction: e, itemWidth: listitemWidth)))
                          .toList())
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
