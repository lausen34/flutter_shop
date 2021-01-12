import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电子商城'),
      ),
      body: Container(
        child: Center(
          child: Text(
            '主界面',
            style: TextStyle(
              color: Colors.red,
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }
}
