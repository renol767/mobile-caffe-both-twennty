import 'package:caffe_both_twenty/models/transaction.dart';
import 'package:caffe_both_twenty/models/api_return_value.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TransactionServices {
  final token = "0a66838fcbd880483b9af2c91c6cef9e";
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() {
    String uid = FirebaseAuth.instance.currentUser.uid;
    return http
        .get(
            "http://192.168.1.15/caffe-booth-twenty/api/transaction?Token=0a66838fcbd880483b9af2c91c6cef9e&uid=$uid")
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        List<Transaction> transactions =
            (jsonData as Iterable).map((e) => Transaction.fromJson(e)).toList();
        return ApiReturnValue(value: transactions);
      }
    });
  }

  // static Future<ApiReturnValue<Transaction>> submitTransaction(
  //     Transaction transaction) async {
  //   String uid = FirebaseAuth.instance.currentUser.uid;
  //   var response = await http.post(
  //       "http://192.168.1.15/caffe-booth-twenty/api/transaction?Token=0a66838fcbd880483b9af2c91c6cef9e",
  //       body: jsonEncode(<String, dynamic>{
  //         'uid': uid,
  //         'food_id': transaction.food.id,
  //         'quantity': transaction.quantity,
  //         'total': transaction.total,
  //         'status': "Belum Bayar"
  //       }));

  //   var data = jsonDecode(response.body);

  //   Transaction value = Transaction.fromJson(data);

  //   return ApiReturnValue(value: value);
  //   // await Future.delayed(Duration(seconds: 2));

  //   // return ApiReturnValue(
  //   //     value: transaction.copyWith(
  //   //         id: 123, status: TransactionStatus.belumbayar));
  // }
}
