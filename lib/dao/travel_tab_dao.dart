import 'dart:async';
import 'dart:convert';
import 'package:xiecheng/model/travel_tab_model.dart';
import 'package:http/http.dart' as http;

const url = 'http://www.devio.org/io/flutter_app/json/travel_page.json';

// 旅拍类别接口
class TravelTabDao {
  static Future<TravelTabModel> fetch() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = const Utf8Decoder();
      var res = json.decode(utf8decoder.convert(response.bodyBytes));
      return TravelTabModel.fromJson(res);
    } else {
      throw Exception("Fail to load HomePage.json");
    }
  }
}
