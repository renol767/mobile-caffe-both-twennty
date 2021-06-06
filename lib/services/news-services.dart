import 'package:caffe_both_twenty/models/api_return_value.dart';
import 'package:caffe_both_twenty/models/news_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsServices {
  static Future<ApiReturnValue<List<News>>> getNews() {
    final token = "0a66838fcbd880483b9af2c91c6cef9e";
    return http
        .get(
            "http://192.168.1.10/caffe-booth-twenty/api/news?Token=0a66838fcbd880483b9af2c91c6cef9e")
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        List<News> news =
            (jsonData as Iterable).map((e) => News.fromJson(e)).toList();
        return ApiReturnValue(value: news);
      }
    });
  }
}
