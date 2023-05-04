import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:habitat/api/base_url.dart';
import 'package:habitat/models/flower_model.dart';
import 'package:http/http.dart' as http;

class ApiFlowers {
  final String baseurl = BaseUrl().rooturl;

  Future<List<FlowerStatusModel>> getGrowingFlower(String userKey) async {
    List<FlowerStatusModel> growingflowerdata = [];

    Uri url = Uri.http(
      baseurl,
      'flowers/exp',
      {
        'userKey': userKey,
      },
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final temp = jsonDecode(utf8.decode(response.bodyBytes));
      // for (var e in temp) {
      growingflowerdata.add(FlowerStatusModel.fromJson(temp));
      debugPrint(growingflowerdata.toString());
      // }
    }

    return growingflowerdata;
  }
}
