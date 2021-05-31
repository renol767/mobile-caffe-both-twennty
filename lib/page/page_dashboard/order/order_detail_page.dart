import 'package:caffe_both_twenty/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Order Detail",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfffd6f19)),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Detail Order",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          widget.transaction.food.picturePath),
                                      fit: BoxFit.cover)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width -
                                      2 * 16 -
                                      60 -
                                      12 -
                                      78,
                                  child: Text(
                                    "  " + widget.transaction.food.name,
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
                                          symbol: '   IDR ',
                                          decimalDigits: 0)
                                      .format(
                                    int.parse(widget.transaction.total),
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
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        )
                      ],
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
                                    "Nama",
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
                                    widget.nama,
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
                                widget.alamat,
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
                                widget.wa,
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
                      height: 50,
                    ),
                    Column(
                      children: [
                        Text("Status",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 30,
                        ),
                        (widget.transaction.status ==
                                TransactionStatus.cancelled)
                            ? Text(
                                'Cancelled',
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 20),
                              )
                            : (widget.transaction.status ==
                                    TransactionStatus.sudahdibayar)
                                ? Text(
                                    'Sudah Dibayar',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 20),
                                  )
                                : Text(
                                    'Belum Dibayar',
                                    style: TextStyle(
                                        color: Color(0xffdab400), fontSize: 20),
                                  ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}