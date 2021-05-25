// To parse this JSON data, do
//
//     final sendTransaction = sendTransactionFromJson(jsonString);

import 'dart:convert';

List<List<SendTransaction>> sendTransactionFromJson(String str) =>
    List<List<SendTransaction>>.from(json.decode(str).map((x) =>
        List<SendTransaction>.from(x.map((x) => SendTransaction.fromJson(x)))));

String sendTransactionToJson(List<List<SendTransaction>> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class SendTransaction {
  SendTransaction(
      {this.id,
      this.uid,
      this.foodId,
      this.quantity,
      this.total,
      this.status,
      this.Token});

  String id;
  String uid;
  String foodId;
  String quantity;
  String total;
  String status;
  String Token;

  factory SendTransaction.fromJson(Map<String, dynamic> json) =>
      SendTransaction(
          id: json["id"],
          uid: json["uid"],
          foodId: json["food_id"],
          quantity: json["quantity"],
          total: json["total"],
          status: json["status"],
          Token: json["Token"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "food_id": foodId,
        "quantity": quantity,
        "total": total,
        "status": status,
        "Token": Token,
      };
}
