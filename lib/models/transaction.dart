import 'package:caffe_both_twenty/models/pelanggan.dart';
import 'package:equatable/equatable.dart';
import 'food_model.dart';

enum TransactionStatus { belumbayar, sudahdibayar, cancelled }

class Transaction extends Equatable {
  final int id;
  final Food food;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus status;

  Transaction({
    this.id,
    this.food,
    this.quantity,
    this.total,
    this.dateTime,
    this.status,
  });

  Transaction copyWith({
    int id,
    Food food,
    int quantity,
    int total,
    DateTime dateTime,
    TransactionStatus status,
  }) {
    Transaction(
        id: id ?? this.id,
        food: food ?? this.food,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [id, food, quantity, total, dateTime, status];
}

List<Transaction> mockTransactions = [
  Transaction(
      id: 1,
      food: mockFoods[1],
      quantity: 10,
      total: (mockFoods[1].price * 10).round(),
      dateTime: DateTime.now(),
      status: TransactionStatus.belumbayar),
  Transaction(
      id: 1,
      food: mockFoods[2],
      quantity: 10,
      total: (mockFoods[2].price * 10).round(),
      dateTime: DateTime.now(),
      status: TransactionStatus.sudahdibayar),
  Transaction(
      id: 1,
      food: mockFoods[3],
      quantity: 10,
      total: (mockFoods[3].price * 10).round(),
      dateTime: DateTime.now(),
      status: TransactionStatus.cancelled),
];
