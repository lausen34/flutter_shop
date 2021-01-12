import 'package:flutter/material.dart';
import 'package:flutter_shop/call/call.dart';

class LoginPage extends StatelessWidget {
  String username;
  LoginPage({String username}){
   this.username = username;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '登录',
          ),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              Call.dispatch("lausen",
                  data: {'name': '登录界面发送消息', 'isLogin': true});
            },
            child: Text("登录界面按钮"),
          ),
        ),
      ),
    );
  }
}
