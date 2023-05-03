import 'package:habitat/api/base_url.dart';
import 'package:http/http.dart' as http;

class ApiUsers {
  final String baseurl = BaseUrl().rooturl;

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
}
