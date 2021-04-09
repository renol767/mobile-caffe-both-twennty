import 'dart:convert';

List<CheckUser> checkUserFromJson(String str) =>
    List<CheckUser>.from(json.decode(str).map((x) => CheckUser.fromJson(x)));

String checkUserToJson(List<CheckUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CheckUser {
  CheckUser({
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

  factory CheckUser.fromJson(Map<String, dynamic> json) => CheckUser(
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
