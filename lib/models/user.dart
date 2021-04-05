class CheckUserModel {
  String uid;
  String firstName;
  String lastName;
  String email;
  String address;
  String numberphone;
  String numberwhatsapp;

  CheckUserModel(
      {this.uid,
      this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.numberphone,
      this.numberwhatsapp});

  factory CheckUserModel.fromJson(final json) {
    return CheckUserModel(
      uid: json["uid"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      address: json["address"],
      numberphone: json["numberphone"],
      numberwhatsapp: json["numberwhatsapp"],
    );
  }
}
