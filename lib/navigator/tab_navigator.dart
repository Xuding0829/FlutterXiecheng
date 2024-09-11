import 'package:flutter/material.dart';
import 'package:xiecheng/pages/home_page.dart';
import 'package:xiecheng/pages/my_page.dart';
import 'package:xiecheng/pages/search_page.dart';
import 'package:xiecheng/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final defaultColor = Colors.grey;
  final activeColor = Colors.blue;
  int currentIndex = 0;

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
        ],
      ),
    );
  }

  bottomItem(String title, IconDate icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: defaultColor),
      activeIcon: Icon(icon, color: activeColor),
      label: Text(title,
          style: TextStyle(
              color: currentIndex != index ? defaultColor : activeColor)),
    );
  }
}
