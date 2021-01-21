import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/component/medium_button.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/data/data_center.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/utils/router_util.dart';
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
  List<CartModel> cartList;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    cartList = DataCenter.getInstance().cartList;
    int price = 0;
    cartList.forEach((cartModel) {
      if (cartModel.is_checked == 1) {
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
              Column(
                children: this._goodItems(),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(20.0),
              right: ScreenUtil().setWidth(20.0),
            ),
            height: ScreenUtil().setHeight(100),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '¥${_allPrice}.00',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: ScreenUtil().setSp(26.0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                KMediumButton(
                  text: KString.SUBMIT_ORDER,
                  color: KColor.SUBMIT_ORDER_BUTTON_COLOR,
                  onPressed: (){
                    this._submitOrder();
                  },
                )
              ],
            ),
          ),
        ));
  }

  List<Widget> _goodItems() {
    List<CartModel> cartList = DataCenter.getInstance().cartList;
    List<Widget> list = List<Widget>();
    cartList.forEach((model) {
      list.add(this._goodItem(model));
      list.add(Divider(
        color: Colors.grey[350],
        height: ScreenUtil().setHeight(1.0),
      ));
    });
    return list;
  }

  Widget _goodItem(CartModel model) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      height: ScreenUtil().setHeight(180.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: ScreenUtil().setWidth(120),
            height: ScreenUtil().setHeight(120),
            child: Image.network(
              model.good_image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(10.0),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.good_name.substring(0, 10),
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(26.0),
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(10.0),
                ),
              ),
              Text(
                '${model.good_price}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: ScreenUtil().setSp(26.0),
                ),
              ),
            ],
          ),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              'X${model.good_count}',
            ),
          ))
        ],
      ),
    );
  }

  void _submitOrder() async{
    List<CartModel> list = List<CartModel>();
    cartList.forEach((model) {
      if(model.is_checked == 1){
        list.add(model);
      }
    });
    var goodJson = list.map((v) => v.toJson()).toList();
    var params = {
      'user_id': this._user_id,
      'username': this._username,
      'pay': this._allPrice,
      'express': 0,
      'mobile': this._mobile,
      'goods': json.encode(goodJson),
      'address': this._address,
    };
    var response = await HttpService.post(ApiUrl.ORDER_ADD,params: params);
    if(response['code'] == 0){
      RouterUtil.toOrderListPage(context);
    }
  }
}
