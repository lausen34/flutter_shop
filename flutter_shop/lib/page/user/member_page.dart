import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notifiy.dart';
import 'package:flutter_shop/component/big_button.dart';
import 'package:flutter_shop/component/show_message.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/utils/token_util.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  bool _isLogin = true;
  String _username = '';

  @override
  void initState() {
    super.initState();
    Call.addCallBack(Notify.LOGIN_STATUS, this._loginCallBack);
    _checkLogin();
  }

  void _checkLogin() async {
    bool login = await TokenUtil.isLogin();
    var user = await TokenUtil.getUserInfo();

    this.setState(() {
      _isLogin = login;
      _username = user['username'];
    });
  }

  void _loginCallBack(data) {
    if (data['isLogin']) {
      _username = data['username'];
      _isLogin = true;
    } else {
      _username = '';
      _isLogin = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      body: ListView(
        children: [
          Container(
            height: ScreenUtil().setHeight(220.0),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/head_bg.png',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ClipOval(
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset(
                        'assets/images/head.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                this._isLogin
                    ? Expanded(
                        flex: 1,
                        child: Text(
                          _username,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                          ),
                        ),
                      )
                    : Expanded(
                        child: InkWell(
                          onTap: () {
                            //TODO 跳转至登录界面
                          },
                          child: Text(
                            KString.LOGIN_OR_REGISTER,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.assessment,
              color: Colors.blue,
            ),
            title: Text(KString.ALL_ORDER),
            onTap: () {
              if (_isLogin) {
                //TODO 跳转到我的订单页面
              } else {
                MessageWiddget.show(KString.PLEASE_LOGIN);
              }
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.favorite_outline,
              color: Colors.redAccent,
            ),
            title: Text(KString.MY_COLLECT),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.attach_money,
              color: Colors.deepOrange,
            ),
            title: Text(KString.MY_COUPON),
          ),
          Container(
            height: 10.0,
            width: double.infinity,
            color: Color.fromRGBO(245, 245, 245, 0.9),
          ),
          ListTile(
            leading: Icon(
              Icons.phone_in_talk,
              color: Colors.green,
            ),
            title: Text(KString.ONLINE_SERVICE),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.black54,
            ),
            title: Text(KString.ABOUT_US),
          ),
          SizedBox(
            height: 50,
          ),
          this._isLogin
              ? KBigButton(
                  text: KString.LOGOUT_TITLE,
                  onPressed: () {
                    this.setState(() {
                      _isLogin = false;
                      _username = '';
                    });

                    var data = {
                      'username':'',
                      'isLogin' : false
                    };
                    Call.dispatch(Notify.LOGIN_STATUS,data: data);
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
