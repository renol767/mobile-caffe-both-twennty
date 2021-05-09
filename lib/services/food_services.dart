import 'package:caffe_both_twenty/models/api_return_value.dart';
import 'package:caffe_both_twenty/models/food_model.dart';
import 'dart:convert';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods() async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockFoods);
  }
}
