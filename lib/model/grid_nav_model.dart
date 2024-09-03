import 'package:xiecheng/model/commom_model.dart';

//首页网格卡片模型
class GridNavModel {
  late GridNavItem hotel;
  late GridNavItem flight;
  late GridNavItem travel;

  GridNavModel(this.hotel, this.flight, this.travel);

  factory GridNavModel.fromJson(Map<String, dynamic> json) {
    return GridNavModel(
        GridNavItem.fromJson(json['hotel']),
        GridNavItem.fromJson(json['flight']),
        GridNavItem.fromJson(json['travel']));
  }
}

class GridNavItem {
  late String startColor;
  late String endColor;
  late CommonModel mainItem;
  late CommonModel item1;
  late CommonModel item2;
  late CommonModel item3;
  late CommonModel item4;

  GridNavItem(this.startColor, this.endColor, this.mainItem, this.item1,
      this.item2, this.item3, this.item4);

  factory GridNavItem.fromJson(Map<String, dynamic> json) {
    return GridNavItem(json['startColor'], json['endColor'], json['mainItem'],
        json['item1'], json['item2'], json['item3'], json['item4']);
  }
}
