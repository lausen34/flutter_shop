import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/data/data_center.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/model/order_model.dart';
import 'package:flutter_shop/utils/token_util.dart';

class OrderInfoPage extends StatefulWidget {
  OrderModel orderModel;
  OrderInfoPage(this.orderModel);
  @override
  _OrderInfoPageState createState() => _OrderInfoPageState();
}

class _OrderInfoPageState extends State<OrderInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(KString.ORDER_DETAIL),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(KString.ALL_PRICE),
              trailing: Text('¥${this.widget.orderModel.pay}'),
            ),
            Divider(
              height: ScreenUtil().setHeight(1.0),
              color: Colors.grey[350],
            ),
            ListTile(
              title: Text(KString.EXPRESS),
              trailing: Text('${this.widget.orderModel.express}'),
            ),
            Divider(
              height: ScreenUtil().setHeight(1.0),
              color: Colors.grey[350],
            ),
            ListTile(
              title: Text(KString.USER_NAME),
              trailing: Text(this.widget.orderModel.username),
            ),
            Divider(
              height: ScreenUtil().setHeight(1.0),
              color: Colors.grey[350],
            ),
            ListTile(
              title: Text(KString.MOBILE),
              trailing: Text(this.widget.orderModel.mobile),
            ),
            Divider(
              height: ScreenUtil().setHeight(1.0),
              color: Colors.grey[350],
            ),
            ListTile(
              title: Text(KString.ADDRESS),
              trailing: Text(this.widget.orderModel.address),
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
    );
  }

  List<Widget> _goodItems() {
    List<OrderGoodModel> _good_list = [];
    List tempList = json.decode(widget.orderModel.goods);
    tempList.forEach((element) {
      _good_list.add(OrderGoodModel.fromJson(element));
    });
    List<Widget> list = [];
    _good_list.forEach(
      (model) {
        list.add(
          _goodItem(model),
        );
        list.add(
          Divider(
            color: Colors.grey[350],
            height: ScreenUtil().setHeight(1.0),
          ),
        );
      },
    );
    return list;
  }

  Widget _goodItem(OrderGoodModel model) {
    print(model.good_name);
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
            ),
          ),
        ],
      ),
    );
  }
}
