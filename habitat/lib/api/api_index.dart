import 'package:http/http.dart' as http;

class ApiIndex {
  final String rooturl = "http://k8a704.p.ssafy.io:8081/";

  void normalapi() async {
    final url = Uri.parse(rooturl);
    await http.get(url);
  }
}
