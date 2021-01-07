import 'package:flutter/material.dart';
import 'package:flutter_shop/component/big_button.dart';

void main() {
  return runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "电子商城",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "电子商城",
          ),
        ),
        body: Container(
          child: Center(
            child: KBigButton(
              text: "登录",
              onPressed: () {
                print('fuck');
              },
            ),
          ),
        ),
      ),
    );
  }
}
