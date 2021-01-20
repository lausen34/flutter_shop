import 'package:flutter/material.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notifiy.dart';
import 'package:flutter_shop/component/small_button.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/page/cart/cart_good_item.dart';
import 'package:flutter_shop/page/cart/cart_settle_account.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter_shop/data/data_center.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _refresh = false;
  bool _isLogin = false;
  int _userId = 1;

  @override
  void initState() {
    super.initState();
    Call.addCallBack(Notify.RELOAD_CART_LIST, this._reloadCartList);
    Call.addCallBack(Notify.LOGIN_STATUS, this._loginCallBack);
    this._checkLogin();
  }

  void _reloadCartList(data) {
    this._initData();
  }

  void _loginCallBack(Map<String, dynamic> data) {
    if (data['isLogin']) {
      this.setState(() {
        _isLogin = true;
        this._initData();
      });
    } else {
      _isLogin = false;
    }
  }

  void _checkLogin() async {
    _isLogin = await TokenUtil.isLogin();
    if (_isLogin) {
      this._initData();
    }
  }

  void _initData() async {
    var user = await TokenUtil.getUserInfo();
    this.setState(() {
      _userId = user.id;
    });
    var params = {
      'user_id': _userId,
    };
    var response = await HttpService.get(ApiUrl.CART_LIST, params: params);
    if (response != null && response['code'] == 0) {
      CartListModel model = CartListModel.fromJson(response['data']);
      DataCenter.getInstance().cartList = model.list;
      this.setState(() {
        _refresh = !_refresh;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(KString.CART_TITLE),
      ),
      body: this._isLogin
          ? Stack(
              children: [
                ListView.builder(
                  itemCount: DataCenter.getInstance().cartList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CartGoodItem(
                      DataCenter.getInstance().cartList[index],
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: CartSettleAccount(),
                ),
              ],
            )
          : Center(
              child: KSmallButton(
                text: KString.LOGIN_TITLE,
                onPressed: () {
                  RouterUtil.toLoginPage(context);
                },
              ),
            ),
    );
  }
}
