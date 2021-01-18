import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/component/item_text_field.dart';
import 'package:flutter_shop/component/logo_container.dart';
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
          elevation: 0,
          title: Text(
            KString.LOGIN_TITLE,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LogoContainer(),
              SizedBox(
                height: 80,
              ),
              _textInputContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textInputContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          ItemTextField(
            icon: Icon(Icons.person),
            controller: _userNameController,
            focusNode: _userNameNode,
            title: KString.USER_NAME,
            hintText: KString.PLEASE_INPUT_ADDRESS,
          ),
          SizedBox(
            height: 20,
          ),
          ItemTextField(
            icon: Icon(Icons.lock),
            controller: _pwdController,
            focusNode: _pwdNode,
            title: KString.PASSWORD,
            hintText: KString.PLEASE_INPUT_PWD,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _forgetPasswordButton(),
              _rigisterButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget _forgetPasswordButton() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: InkWell(
        child: Text(
          KString.FORGET_PASSWORD,
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(28),
          ),
        ),
      ),
    );
  }

  Widget _rigisterButton() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: InkWell(
        onTap: (){
          //TODO 快速注册
        },
        child: Text(
          KString.FAST_REGISTER,
          style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(28),
          ),
        ),
      ),
    );
  }
}
