import 'package:flutter/material.dart';
import 'package:flutter_shop/component/small_button.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/cart_model.dart';
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
  bool _isLogin = true;
  int _userId = 1;

  @override
  void initState() {
    super.initState();
    this._initData();
  }
  void _initData() async{
    var user = await TokenUtil.getUserInfo();
    this.setState(() {
      _userId = user.id;
    });
    var params = {
      'user_id':_userId,
    };
    var response = await HttpService.get(ApiUrl.CART_LIST,params: params);
    if(response != null && response['code'] == 0){
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
                ListView(),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Text('fuck'),
                ),
              ],
            )
          : Center(
        child: KSmallButton(
          text: KString.LOGIN_TITLE,
          onPressed: (){
            RouterUtil.toLoginPage(context);
          },
        ),
      ),
    );
  }
}
