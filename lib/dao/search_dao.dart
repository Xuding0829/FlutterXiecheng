import 'dart:async';
import 'dart:convert';
import 'package:xiecheng/model/search_model.dart';
import 'package:http/http.dart' as http;

// 搜索接口
class SearchDao {
  static Future<SearchModel> fetch(String url, String text) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = const Utf8Decoder();
      var res = json.decode(utf8decoder.convert(response.bodyBytes));
      SearchModel model = SearchModel.fromJson(res);
      model.keyword = text;
      return model;
    } else {
      throw Exception("Fail to load HomePage.json");
    }
  }
}
