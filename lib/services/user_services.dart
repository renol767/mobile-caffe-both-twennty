import 'package:http/http.dart' as http;
import '../models/fetchuser.dart';
import 'dart:convert';

class UserService {
  Future<FetchUser> getFetchuser(String uid) {
    final token = "0a66838fcbd880483b9af2c91c6cef9e";
    return http
        .get(
            "http://192.168.1.10/caffe-booth-twenty/api/infodata?uid=$uid&Token=$token")
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return FetchUser.fromJson(jsonData[0]);
      }
    });
  }
}
