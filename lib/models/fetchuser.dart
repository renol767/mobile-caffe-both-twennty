import 'dart:convert';

class FetchUser {
  FetchUser({
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

  factory FetchUser.fromJson(Map<String, dynamic> jsonData) {
    return FetchUser(
      uid: jsonData["uid"],
      firstName: jsonData["first_name"],
      lastName: jsonData["last_name"],
      email: jsonData["email"],
      address: jsonData["address"],
      numberphone: jsonData["numberphone"],
      numberwhatsapp: jsonData["numberwhatsapp"],
    );
  }
}
