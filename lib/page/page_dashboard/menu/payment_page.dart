import 'package:caffe_both_twenty/models/transaction.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  String nama, alamat, wa;

  PaymentPage({this.transaction, this.nama, this.alamat, this.wa});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
