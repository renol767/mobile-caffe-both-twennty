// To parse this JSON data, do
//
//     final sendTransaction = sendTransactionFromJson(jsonString);

import 'dart:convert';

List<SendTransaction> sendTransactionFromJson(String str) =>
    List<SendTransaction>.from(
        json.decode(str).map((x) => SendTransaction.fromJson(x)));

String sendTransactionToJson(List<SendTransaction> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SendTransaction {
  SendTransaction(
      {this.id,
      this.uid,
      this.foodId,
      this.quantity,
      this.total,
      this.status,
      this.datetime});

  String id;
  String uid;
  String foodId;
  String quantity;
  String total;
  String status;
  String datetime;

  factory SendTransaction.fromJson(Map<String, dynamic> json) =>
      SendTransaction(
          id: json["id"],
          uid: json["uid"],
          foodId: json["food_id"],
          quantity: json["quantity"],
          total: json["total"],
          status: json["status"],
          datetime: json["datetime"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "food_id": foodId,
        "quantity": quantity,
        "total": total,
        "status": status,
        "datetime": datetime
      };
}
