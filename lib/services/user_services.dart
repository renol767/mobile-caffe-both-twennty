import 'package:http/http.dart' as http;
import '../models/fetchuser.dart';
import 'dart:convert';

class UserService {
  Future<FetchUser> getFetchuser(String uid) {
    return http
        .get("http://192.168.1.10/caffe_both_twenty/api/user?uid=$uid")
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return FetchUser.fromJson(jsonData[0]);
      }
    });
  }
}
