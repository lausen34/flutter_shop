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

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _userNameController;
  TextEditingController _pwdController;
  TextEditingController _mobileController;
  TextEditingController _addressController;

  FocusNode _userNameNode = FocusNode();
  FocusNode _pwdNode = FocusNode();
  FocusNode _mobileNode = FocusNode();
  FocusNode _addressNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _pwdController = TextEditingController();
    _mobileController = TextEditingController();
    _addressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            KString.REGISTER_TITLE,
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
              _registerContent(context),
              KBigButton(
                text: KString.REGISTER_TITLE,
                onPressed: () {
                  if (this._checkInput()) {
                    this._register();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          _itemTitle(
            KString.USERNAME,
          ),
          ItemTextField(
            icon: Icon(
              Icons.person,
            ),
            controller: _userNameController,
            focusNode: _userNameNode,
            title: KString.USER_NAME,
            hintText: KString.PLEASE_INPUT_NAME,
          ),
          SizedBox(
            height: 20,
          ),
          _itemTitle(
            KString.MOBILE,
          ),
          ItemTextField(
            icon: Icon(
              Icons.phone_android,
            ),
            controller: _mobileController,
            focusNode: _mobileNode,
            title: KString.MOBILE,
            hintText: KString.PLEASE_INPUT_MOBILE,
          ),
          SizedBox(
            height: 20,
          ),
          _itemTitle(
            KString.PASSWORD,
          ),
          ItemTextField(
            icon: Icon(
              Icons.lock,
            ),
            controller: _pwdController,
            focusNode: _pwdNode,
            title: KString.PASSWORD,
            hintText: KString.PLEASE_INPUT_PWD,
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          _itemTitle(
            KString.ADDRESS,
          ),
          ItemTextField(
            icon: Icon(
              Icons.home,
            ),
            controller: _addressController,
            focusNode: _addressNode,
            title: KString.ADDRESS,
            hintText: KString.PLEASE_INPUT_ADDRESS,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _itemTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      ),
    );
  }

  bool _checkInput() {
    if (_userNameController.text.length == 0) {
      MessageWiddget.show(
        KString.PLEASE_INPUT_NAME,
      );
    } else if (_mobileController.text.length == 0) {
      MessageWiddget.show(
        KString.PLEASE_INPUT_PWD,
      );
    } else if (_pwdController.text.length == 0) {
      MessageWiddget.show(
        KString.PLEASE_INPUT_PWD,
      );
    } else if (_addressController.text.length == 0) {
      MessageWiddget.show(
        KString.PLEASE_INPUT_ADDRESS,
      );
    }
    return true;
  }

  void _register() async {
    var formData = {
      'username': _userNameController.text.toString(),
      'mobile': _mobileController.text.toString(),
      'password': _pwdController.text.toString(),
      'address': _addressController.text.toString(),
    };
    var response = await HttpService.post(ApiUrl.USER_REGISTER, params: formData);
    if (response['code'] == 0) {
      UserModel model = UserModel.fromJson(response['data']);
      MessageWiddget.show(
        KString.REGISTER_SUCCESS,
      );
      await TokenUtil.saveLoginInfo(model);
      var data = {
        'username': model.username,
        'isLogin': true,
      };
      Call.dispatch(Notify.LOGIN_STATUS, data: data);
      RouterUtil.toMemberPage(context);
    } else {
      MessageWiddget.show(
        KString.REGISTER_FAILED,
      );

    }
  }
}
