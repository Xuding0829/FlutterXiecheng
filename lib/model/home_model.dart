import 'package:xiecheng/model/commom_model.dart';
import 'package:xiecheng/model/config_model.dart';
import 'package:xiecheng/model/grid_nav_model.dart';
import 'package:xiecheng/model/sales_box_model.dart';

class HomeModel {
  final ConfigModel configModel;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;
  final GridNavModel gridNavModel;
  final SalesBoxModel salesBox;

  HomeModel(this.configModel, this.bannerList, this.localNavList,
      this.subNavList, this.gridNavModel, this.salesBox);

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var localNavListJson = json['localNavList'] as List;
    List<CommonModel> localNavList =
        localNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    var bannerListJson = json['localNavList'] as List;
    List<CommonModel> bannerList =
        bannerListJson.map((i) => CommonModel.fromJson(i)).toList();

    var subNavListJson = json['localNavList'] as List;
    List<CommonModel> subNavList =
        subNavListJson.map((i) => CommonModel.fromJson(i)).toList();

    return HomeModel(
        ConfigModel.fromJson(json['config']),
        bannerList,
        localNavList,
        subNavList,
        GridNavModel.fromJson(json['gridNav']),
        SalesBoxModel.fromJson(json['salesBox']));
  }
}
