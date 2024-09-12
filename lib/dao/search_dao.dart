import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:xiecheng/model/search_model.dart';
import 'package:http/http.dart' as http;

const SEARCH_URL =
    'https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=';

// 搜索接口
class SearchDao {
  static Future<SearchModel> fetch(String text) async {
    Response response = await Dio().get(SEARCH_URL + text);
    if (response.statusCode == 200) {
      // 只有当输入的内容与服务端返回的内容一致时才渲染
      SearchModel model = SearchModel.fromJson(response.data);
      model.keyword = text;
      return model;
    } else {
      throw Exception('Failed to load search');
    }
  }
}
