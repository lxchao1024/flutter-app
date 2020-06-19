import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'pages/home_page.dart';
import 'pages/category_page.dart';
import 'pages/cart_page.dart';
import 'pages/member_page.dart';

class MainView extends StatefulWidget {
  @override
  createState() => new MainState();
}

class MainState extends State<MainView> {

  final List tabBarList = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  final List titles = [
    new Text('首页'),
    new Text('分类'),
    new Text('购物车'),
    new Text('会员中心')
  ];

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        title: Text('首页')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        title: Text('分类')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: Text('购物车')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: Text('会员中心')
    ),
  ];

  int currentIndex = 0;
  var currentPage;
  var titleView;

  @override
  void initState() {
    currentPage = tabBarList[currentIndex];
    titleView = titles[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Hello',
      home: new Scaffold(
        appBar: new AppBar(
          title: titleView,
          centerTitle: true,
        ),
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabs,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              currentPage = tabBarList[currentIndex];
              titleView = titles[currentIndex];
            });
          },
        ),
      ),
    );
  }
}