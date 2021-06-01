import 'package:caffe_both_twenty/models/pelanggan.dart';
import 'package:equatable/equatable.dart';
import 'food_model.dart';

enum TransactionStatus { belumbayar, sudahdibayar, complete }

class Transaction extends Equatable {
  final dynamic id;
  final Food food;
  final dynamic quantity;
  final dynamic total;
  final String dateTime;
  final TransactionStatus status;

  Transaction({
    this.id,
    this.food,
    this.quantity,
    this.total,
    this.status,
    this.dateTime,
  });

  Transaction copyWith({
    dynamic id,
    Food food,
    dynamic quantity,
    dynamic total,
    TransactionStatus status,
    String dateTime,
  }) {
    Transaction(
      id: id ?? this.id,
      food: food ?? this.food,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      status: status ?? this.status,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> jsonData) => Transaction(
      id: jsonData['id'],
      food: Food.fromJson(jsonData),
      quantity: jsonData['quantity'],
      total: jsonData['total'],
      status: (jsonData['status'] == 'Belum Bayar')
          ? TransactionStatus.belumbayar
          : (jsonData['status'] == 'Sudah DiBayar')
              ? TransactionStatus.sudahdibayar
              : TransactionStatus.complete,
      dateTime: jsonData['datetime']);

  @override
  List<Object> get props => [id, food, quantity, total, status, dateTime];
}
