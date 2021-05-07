import 'package:caffe_both_twenty/models/food_model.dart';
import 'package:caffe_both_twenty/models/transaction.dart';
import 'package:caffe_both_twenty/widgets/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;

  OrderListItem({@required this.transaction, @required this.itemWidth});
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
                  image: NetworkImage(transaction.food.picturePath),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food.name,
                style: TextStyle(
                    color: Color(0xfffd6f19), fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '${transaction.quantity} items ' +
                    NumberFormat.currency(
                            symbol: "IDR ", decimalDigits: 0, locale: "id-ID")
                        .format(transaction.total),
                style: TextStyle(color: Color(0xfffd6f19), fontSize: 13),
              )
            ],
          ),
        ),
        SizedBox(
            width: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(convertDateTime(transaction.dateTime)),
                SizedBox(
                  height: 8,
                ),
                (transaction.status == TransactionStatus.cancelled)
                    ? Text(
                        'Cancelled',
                        style: TextStyle(color: Colors.redAccent, fontSize: 13),
                      )
                    : (transaction.status == TransactionStatus.sudahdibayar)
                        ? Text(
                            'Sudah Dibayar',
                            style: TextStyle(color: Colors.green, fontSize: 13),
                          )
                        : Text(
                            'Belum Dibayar',
                            style: TextStyle(
                                color: Color(0xffdab400), fontSize: 13),
                          ),
              ],
            ))
      ],
    );
  }

  String convertDateTime(DateTime dateTime) {
    String month;
    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      default:
        month = 'Des';
    }

    return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }
}
