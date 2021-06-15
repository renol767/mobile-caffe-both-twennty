import 'package:caffe_both_twenty/models/api_return_value.dart';
import 'package:caffe_both_twenty/models/food_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods() {
    final token = "0a66838fcbd880483b9af2c91c6cef9e";
    return http
        .get(
            "http://192.168.1.6/caffe-booth-twenty/api/food?Token=0a66838fcbd880483b9af2c91c6cef9e")
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        List<Food> foods =
            (jsonData as Iterable).map((e) => Food.fromJson(e)).toList();
        return ApiReturnValue(value: foods);
      }
    });
  }
}
