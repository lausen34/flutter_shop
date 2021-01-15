import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  TextEditingController _userNameController;
  TextEditingController _pwdController;
  FocusNode _userNameNode = FocusNode();
  FocusNode _pwdNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _pwdController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            KString.LOGOUT_TITLE,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}
