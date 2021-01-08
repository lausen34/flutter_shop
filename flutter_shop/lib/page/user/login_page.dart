import 'package:flutter/material.dart';

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
          child: Text(
            username,
          ),
        ),
      ),
    );
  }
}
