import 'package:caffe_both_twenty/cubit/food_cubit.dart';
import 'package:caffe_both_twenty/cubit/news_cubit.dart';
import 'package:caffe_both_twenty/cubit/transaction_cubit.dart';
import 'package:caffe_both_twenty/page/page_dashboard/order.dart';
import 'package:caffe_both_twenty/page/page_dashboard/menu.dart';
import 'package:caffe_both_twenty/page/page_dashboard/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid, number;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _currentIndex = 0;
  PageController _pageController;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FoodCubit()),
        BlocProvider(create: (_) => TransactionCubit()),
        BlocProvider(create: (_) => NewsCubit())
      ],
      child: Scaffold(
        body: WillPopScope(
          onWillPop: onWillPop,
          child: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: <Widget>[
                Menu(),
                Order(),
                Profile(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text('Menu'),
                icon: FaIcon(FontAwesomeIcons.utensils, size: 17),
                activeColor: Color(0xfffd6f19)),
            BottomNavyBarItem(
                title: Text('Order'),
                icon: FaIcon(FontAwesomeIcons.shoppingBasket, size: 17),
                activeColor: Color(0xfffd6f19)),
            BottomNavyBarItem(
                title: Text('Others'),
                icon: Icon(Icons.settings),
                activeColor: Color(0xfffd6f19)),
          ],
        ),
      ),
    );
  }

  DateTime currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Tekan Lagi Untuk Keluar");
      return Future.value(false);
    }
    SystemNavigator.pop();
    return Future.value(true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    uid = FirebaseAuth.instance.currentUser.uid;
    number = FirebaseAuth.instance.currentUser.phoneNumber;
  }
}
