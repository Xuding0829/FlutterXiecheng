import 'package:flutter/material.dart';
import 'package:xiecheng/model/commom_model.dart';
import 'package:xiecheng/model/grid_nav_model.dart';
import 'package:xiecheng/model/home_model.dart';
import 'package:xiecheng/model/sales_box_model.dart';

const searchBarText = '网红打卡地 景点 酒店 美食';
const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0;
  List<CommonModel> localNavList = [];
  List<CommonModel> bannerList = [];
  List<CommonModel> subNavList = [];
  GridNavModel? gridNavModel;
  SalesBoxModel? salesBoxModel;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _handleRefresh();
    Future.delayed(Duration(milliseconds: 600), () {
      FlutterSplashScreen.hide();
    });
  }

  _onScroll(offset) {}

  Future<Null> _handleRefresh() async {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  Widget get _listView {}

  Widget get _appBar {}

  Widget get _banner {}

  _jumpToSearch() {}

  _jumpToSpeak() {}
}
