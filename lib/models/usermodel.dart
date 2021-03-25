// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.uid,
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.numberphone,
    this.numberwhatsapp,
  });

  String uid;
  String firstName;
  String lastName;
  String email;
  String address;
  String numberphone;
  String numberwhatsapp;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        address: json["address"],
        numberphone: json["numberphone"],
        numberwhatsapp: json["numberwhatsapp"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "address": address,
        "numberphone": numberphone,
        "numberwhatsapp": numberwhatsapp,
      };
}
