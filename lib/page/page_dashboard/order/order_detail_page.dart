import 'package:caffe_both_twenty/models/transaction.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  final Transaction transaction;
  String nama, alamat, wa;
  OrderDetailPage({this.transaction, this.nama, this.alamat, this.wa});

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
