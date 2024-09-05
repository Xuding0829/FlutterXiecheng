import 'dart:async';
import 'dart:convert';
import 'package:xiecheng/model/home_model.dart';
import 'package:http/http.dart' as http;

const url = 'http://www.devio.org/io/flutter_app/json/home_page.json';

// 首页接口
class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = const Utf8Decoder();
      var res = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(res);
    } else {
      throw Exception("Fail to load HomePage.json");
    }
  }
}
