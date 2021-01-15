import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notifiy.dart';
import 'package:flutter_shop/config/index.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  bool _isLogin = false;
  String _username = '';

  @override
  void initState() {
    super.initState();
    // Call.addCallBack(Notify.LOGIN_STATUS, this._loginCallBack);
    _checkLogin();
  }

  void _checkLogin() async {}

  void _loginCallBack(data) {
    if (data['isLogin']) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }
}
