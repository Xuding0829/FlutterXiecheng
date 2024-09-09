import 'package:flutter/material.dart';
import 'package:xiecheng/dao/home_dao.dart';
import 'package:xiecheng/model/commom_model.dart';
import 'package:xiecheng/model/grid_nav_model.dart';
import 'package:xiecheng/model/home_model.dart';
import 'package:xiecheng/model/sales_box_model.dart';
import 'package:xiecheng/pages/search_page.dart';
import 'package:xiecheng/pages/speak_page.dart';
import 'package:xiecheng/util/navifator_util.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';

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
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _handleRefresh();
    Future.delayed(Duration(milliseconds: 600), () {
      FlutterSplashScreen.hide();
    });
  }

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

  Future<Null> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        localNavList = model.localNavList;
        subNavList = model.subNavList;
        gridNavModel = model.gridNavModel;
        salesBoxModel = model.salesBox;
        bannerList = model.bannerList;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: LoadingContainer(
            isLoading: _loading,
            child: Stack(
              children: <Widget>[
                MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: NotificationListener(
                        onNotification: (scroolNotification) {
                          if (scroolNotification is ScrollUpdateNotification &&
                              scroolNotification.depth == 0) {
                            _onScroll(scroolNotification.metrics.pixels);
                          }
                        },
                        child: _listView,
                      )),
                ),
                _appBar
              ],
            )));
  }

  Widget get _listView {
    return ListView(
      children: <Widget>[
        _banner,
        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7,4),
          child: LocalNav(localNavList:localNavList),
        )
      ],
    )
  }

  Widget get _appBar {}

  Widget get _banner {}

  _jumpToSearch() {
    NavigatorUtil.push(
      context, 
      SearchPage(
        hint:SEARCH_BAR_DEFAULT_TEXT,
        ));
  }

  _jumpToSpeak() {
    NavigatorUtil.push(context, SpeakPage());
  }
}
