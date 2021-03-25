import 'dart:convert';
import 'package:http/http.dart' as http;

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
  // static Future<User> connectToAPI(String id) async {
  //   String apiURL =
  //       "https://0ba28d60f15343b797e43f64a5a4258a.000webhostapp.com/api/user?uid=" +
  //           id;
  //   var apiResult = await http.get(apiURL);
  //   var jsonObject = json.decode(apiResult.body);

  //   return User.fromJson(jsonObject);
  // }
}
