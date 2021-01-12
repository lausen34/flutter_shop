import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/page/main_page.dart';

void main() {
  return runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lausen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: KColor.PRIMARY_COLOR,
      ),
      home: MainPage(),
    );
  }
}
