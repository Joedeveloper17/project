import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:project/files.dart';

class Userapi {
  Future<List<Files>?> getfiles() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return filesFromJson(json);
    }
    return null;
  }
}
