import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../page/user/login_page.dart';

class RouterUtil {
  static toLoginPage(BuildContext context, String username) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(
          username: username,
        ),
      ),
    );
  }

  static pop(BuildContext context){
    Navigator.pop(context);
  }
}
