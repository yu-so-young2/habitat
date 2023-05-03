import 'dart:convert';
import 'package:habitat/api/base_url.dart';
import 'package:habitat/models/users_model.dart';
import 'package:http/http.dart' as http;

class ApiUsers {
  final String baseurl = BaseUrl().rooturl;

  // 유저의 오늘 목표 음수량 재설정
  void patchUserModifyGoal(String userKey) {
    Uri url = Uri.http(
      baseurl,
      'users/modify/goal',
      {
        'userKey': userKey,
      },
    );
    http.patch(url);
  }

  Future<List<Usersmodel>> getUserInfo(String userKey) async {
    List<Usersmodel> getuserinfodata = [];

    Uri url = Uri.http(
      baseurl,
      'users',
      {
        'userKey': userKey,
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> temp = jsonDecode(response.body);
      for (var e in temp) {
        getuserinfodata.add(Usersmodel.fromJson(e));
      }
    }

    return getuserinfodata;
  }
}
