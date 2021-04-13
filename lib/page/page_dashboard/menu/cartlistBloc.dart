import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:caffe_both_twenty/models/fooditem.dart';
import 'provider.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {
  CartListBloc();
  var _listController = BehaviorSubject<List<FoodItem>>.seeded([]);

//provider class
  final cartItemController = StreamController.broadcast();
  CartProvider provider = CartProvider();

//output
  Stream<List<FoodItem>> get listStream => _listController.stream;

//input
  Sink<List<FoodItem>> get listSink => _listController.sink;

  addToList(FoodItem foodItem) {
    listSink.add(provider.addToList(foodItem));
  }

  removeFromList(FoodItem foodItem) {
    listSink.add(provider.removeFromList(foodItem));
  }

//dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
