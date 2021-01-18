import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/component/big_button.dart';
import 'package:flutter_shop/component/item_text_field.dart';
import 'package:flutter_shop/component/logo_container.dart';
import 'package:flutter_shop/component/show_message.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/user_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/call/notifiy.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/utils/token_util.dart';

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
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          KBigButton(
            text: KString.LOGIN_TITLE,
            onPressed: () {
              if (this._checkInput()) {
                this._login();
              }
            },
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
        onTap: () {
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

  bool _checkInput() {
    if (_userNameController.text.length == 0) {
      MessageWiddget.show(
        KString.PLEASE_INPUT_NAME,
      );
    } else if (_pwdController.text.length == 0) {
      MessageWiddget.show(
        KString.PLEASE_INPUT_PWD,
      );
    }
    return true;
  }

  void _login() async {
    var formData = {
      'username': _userNameController.text.toString(),
      'password': _pwdController.text.toString(),
    };
    var response = await HttpService.post(ApiUrl.USER_LOGIN, params: formData);
    print(response);
    if (response['code'] == 0) {
      UserModel model = UserModel.fromJson(response['data']);
      MessageWiddget.show(
        KString.LOGIN_SUCCESS,
      );
      await TokenUtil.saveLoginInfo(model);
      var data = {
        'username': model.username,
        'isLogin': true,
      };
      Call.dispatch(Notify.LOGIN_STATUS, data: data);
      RouterUtil.pop(context);
    } else {
      MessageWiddget.show(
        KString.LOGIN_FAILED,
      );
      var data = {
        'username': '',
        'isLogin': false,
      };
    }
  }
}
