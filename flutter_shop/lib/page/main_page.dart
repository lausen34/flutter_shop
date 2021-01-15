import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/page/cart/cart_page.dart';
import 'package:flutter_shop/page/category/category_page.dart';
import 'package:flutter_shop/page/home/home_page.dart';
import 'package:flutter_shop/page/user/member_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<BottomNavigationBarItem> _tabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: KString.MENMBER_TITLE,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: KString.HOME_TITLE,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: KString.CATEGORY_TITLE,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: KString.CART_TITLE,
    ),
  ];

  List<StatefulWidget> _pages = [
    MemberPage(),
    HomePage(),
    CategoryPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: _tabs,
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
    );
  }
}
