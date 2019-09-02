import '../models.dart/dil_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Dil_api {
  LanguageData res;

  Future<LanguageData> getlanguages() async {
    http.get(
        "**************************",
        headers: {
          'Content-Type': 'application/json'
        }).then((http.Response response) {
      if (response.statusCode != 200) print(response.statusCode);
      Map<String, Object> key = json.decode(response.body);
      res = LanguageData.fromJson(key["languageList"]);
      return res;
    });
  }
  
}
