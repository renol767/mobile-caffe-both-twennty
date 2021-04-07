import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HowToOrder extends StatefulWidget {
  HowToOrder({Key key}) : super(key: key);

  @override
  _HowToOrderState createState() => _HowToOrderState();
}

class _HowToOrderState extends State<HowToOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
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
              Icons.arrow_back,
              color: Color(0xfffd6f19),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Cara Order",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfffd6f19)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  isFirst: true,
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.redAccent,
                    indicatorY: 0.2,
                    padding: EdgeInsets.all(8),
                  ),
                  leftChild: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/timetile_store.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Pergi Ke Caffe",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.redAccent),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Pergi Ke Caffe Booth Twenty",
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade500),
                        )
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.lightBlueAccent,
                    padding: EdgeInsets.all(8),
                    indicatorY: 0.3,
                  ),
                  rightChild: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/timetile_food.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Pilih Makanan/Minuman",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Pilih Makanan/Minuman Sampai Ke Proses Checkout",
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade400),
                        )
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.purple,
                    padding: EdgeInsets.all(8),
                    indicatorY: 0.3,
                  ),
                  leftChild: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/timetile_qr.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Scan QR",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.purple.shade300),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Scan QR Code yang ada di meja untuk mendapatkan nota",
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade400),
                        )
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.yellow,
                    padding: EdgeInsets.all(8),
                    indicatorY: 0.3,
                  ),
                  rightChild: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/timetile_bayar.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Bayar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.yellow.shade700),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Bayar di kasir dengan menunjukan nota yang di dapat",
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade400),
                        )
                      ],
                    ),
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.center,
                  isLast: true,
                  indicatorStyle: const IndicatorStyle(
                    width: 20,
                    color: Colors.green,
                    padding: EdgeInsets.all(8),
                    indicatorY: 0.3,
                  ),
                  leftChild: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/timetile_done.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Berhasil",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.green),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Orderan akan segera diproses",
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade400),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Delivery ?",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfffd6f19)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.only(left: 55, right: 55),
                  child: Column(
                    children: [
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        textColor: Colors.white,
                        height: 50.0,
                        color: Colors.green,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Order Via Whatsapp',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        textColor: Colors.white,
                        height: 50.0,
                        color: Colors.green.shade400,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Order Via Gofood',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        textColor: Colors.white,
                        height: 50.0,
                        color: Colors.green.shade400,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Order Via GrabFood',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
