import 'package:xiecheng/model/commom_model.dart';

class SalesBoxModel {
  late String icon;
  late String moreUrl;
  late CommonModel bigCard1;
  late CommonModel bigCard2;
  late CommonModel smallCard1;
  late CommonModel smallCard2;
  late CommonModel smallCard3;
  late CommonModel smallCard4;

  SalesBoxModel(this.icon, this.moreUrl, this.bigCard1, this.bigCard2,
      this.smallCard1, this.smallCard2, this.smallCard3, this.smallCard4);

  factory SalesBoxModel.fromJson(Map<String, dynamic> json) {
    return SalesBoxModel(
        json['icon'],
        json['moreUrl'],
        CommonModel.fromJson(json['bigCard1']),
        CommonModel.fromJson(json['bigCard2']),
        CommonModel.fromJson(json['smallCard1']),
        CommonModel.fromJson(json['smallCard2']),
        CommonModel.fromJson(json['smallCard3']),
        CommonModel.fromJson(json['smallCard4']));
  }
}
