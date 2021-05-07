import 'dart:async';
import 'package:caffe_both_twenty/models/pelanggan.dart';
import 'package:caffe_both_twenty/models/transaction.dart';
import 'package:caffe_both_twenty/models/food_model.dart';
import 'package:caffe_both_twenty/page/page_dashboard/menu/food_detail_page.dart';
import 'package:caffe_both_twenty/page/page_dashboard/menu/payment_page.dart';
import 'package:caffe_both_twenty/services/user_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'page/splashscreen.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  setupLocaator();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

void setupLocaator() {
  GetIt.I.registerLazySingleton(() => UserService());
}

class MyApp extends StatelessWidget {
  @override
  void initState() {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
