import 'package:equatable/equatable.dart';

class Pelanggan extends Equatable {
  String uid;
  String firstName;
  String lastName;
  String email;
  String address;
  String numberphone;
  String numberwhatsapp;

  Pelanggan({
    this.uid,
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.numberphone,
    this.numberwhatsapp,
  });
  @override
  List<Object> get props =>
      [uid, firstName, lastName, email, address, numberphone, numberwhatsapp];
}

Pelanggan mockUser = Pelanggan(
    uid: "WjZ87zduK5Sp842TxHDT6Q70SZY2",
    firstName: 'Renol',
    lastName: 'Nindi Kara',
    email: 'renol@mail.com',
    address: 'Majalengka',
    numberphone: '+6281394845127',
    numberwhatsapp: '+6281394845127');
