import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/data/data_center.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/utils/token_util.dart';

class WriteOrderPage extends StatefulWidget {
  @override
  _WriteOrderPageState createState() => _WriteOrderPageState();
}

class _WriteOrderPageState extends State<WriteOrderPage> {
  int _allPrice = 0;
  String _username = '';
  String _mobile = '';
  String _address = '';
  int _user_id = 0;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    List<CartModel> cartList = DataCenter.getInstance().cartList;
    int price = 0;
    cartList.forEach((cartModel) {
      if(cartModel.is_checked == 1){
        price += (cartModel.good_price * cartModel.good_count);
      }
    });

    var user = await TokenUtil.getUserInfo();
    this.setState(() {
      this._allPrice = price;
      this._username = user.username;
      this._mobile = user.mobile;
      this._address = user.address;
      this._user_id = user.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(KString.MY_ORDER),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(KString.ALL_PRICE),
              trailing: Text('¥${_allPrice}'),
            ),
            Divider(
              height: ScreenUtil().setHeight(1.0),
              color: Colors.grey[350],
            ),
            ListTile(
              title: Text(KString.EXPRESS),
              trailing: Text('¥0'),
            ),
            Divider(
              height: ScreenUtil().setHeight(1.0),
              color: Colors.grey[350],
            ),
            ListTile(
              title: Text(KString.USER_NAME),
              trailing: Text('$_username'),
            ),
            Divider(
              height: ScreenUtil().setHeight(1.0),
              color: Colors.grey[350],
            ),
            ListTile(
              title: Text(KString.MOBILE),
              trailing: Text('$_mobile'),
            ),
            Divider(
              height: ScreenUtil().setHeight(1.0),
              color: Colors.grey[350],
            ),
            ListTile(
              title: Text(KString.ADDRESS),
              trailing: Text('$_address'),
            ),
            Divider(
              height: ScreenUtil().setHeight(1.0),
              color: Colors.grey[350],
            ),
          ],
        ),
      ),
    );
  }
}
