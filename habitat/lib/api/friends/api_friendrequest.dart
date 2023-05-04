import 'dart:convert';

import 'package:habitat/api/base_url.dart';
import 'package:habitat/models/friend_request_model.dart';
import 'package:http/http.dart' as http;

class ApiFriendRequestList {
  final String baseurl = BaseUrl().rooturl;

  Future<List<FriendRequestModel>> getRequestFriendList(String id) async {
    List<FriendRequestModel> friendlist = [];

    Uri url = Uri.http(baseurl, 'friends/request/all', {'userKey': id});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> temp = jsonDecode(utf8.decode(response.bodyBytes));
      for (var e in temp) {
        friendlist.add(FriendRequestModel.fromJson(e));
      }
    }

    return friendlist;
  }
}
