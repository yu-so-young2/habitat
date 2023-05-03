import 'dart:convert';
import 'package:habitat/api/base_url.dart';
import 'package:habitat/models/drink_log_model.dart';
import 'package:http/http.dart' as http;

class ApiDrinkLogs {
  final String baseurl = BaseUrl().rooturl;

  Future<List<Drinklogmodel>> getAllDrinkLogs(String id) async {
    List<Drinklogmodel> drinklogdata = [];

    Uri url = Uri.http(baseurl, 'drinkLogs/all', {'userKey': id});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> temp = jsonDecode(response.body);
      for (var e in temp) {
        drinklogdata.add(Drinklogmodel.fromJson(e));
      }
    }

    return drinklogdata;
  }
}
