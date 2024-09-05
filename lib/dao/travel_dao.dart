import 'dart:async';
import 'dart:convert';
import 'package:xiecheng/model/travel_model.dart';
import 'package:http/http.dart' as http;

var Params = {
  "districtId": -1,
  "groupChannelCode": "RX-OMF",
  "type": null,
  "lat": -180,
  "lon": -180,
  "locatedDistrictId": 0,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {'cid': "09031014111431397988"},
  "contentType": "json"
};

// 旅拍页接口
class TravelDao {
  static Future<TravelModel> fetch(String url, Map params,
      String groupChannelCode, int pageIndex, int pageSize) async {
    Map paramsMap = params['pagePara'];
    paramsMap['pageIndex'] = pageIndex;
    paramsMap['pageSize'] = pageSize;
    paramsMap['groupChannelCode'] = groupChannelCode;

    final response = await http.post(Uri.parse(url), body: jsonEncode(params));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = const Utf8Decoder();
      var res = json.decode(utf8decoder.convert(response.bodyBytes));
      return TravelModel.fromJson(res);
    } else {
      throw Exception("Fail to load HomePage.json");
    }
  }
}
