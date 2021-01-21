import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/order_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/utils/token_util.dart';

class OrderListPage extends StatefulWidget {
  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  List<OrderModel> _list = [];

  @override
  void initState() {
    super.initState();
    this._initData();
  }

  void _initData() async {
    var user = await TokenUtil.getUserInfo();
    var params = {
      'user_id': user.id,
    };
    var response = await HttpService.get(ApiUrl.ORDER_LIST, params: params);
    if (response['code'] == 0) {
      this.setState(() {
        _list = OrderListModel.fromJson(response['data']).list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(KString.MY_ORDER),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: this._list.length,
        itemBuilder: (BuildContext context, int index) {
          return _orderItem(_list[index]);
        },
      ),
    );
  }

  Widget _orderItem(OrderModel order) {
    List<OrderGoodModel> _goods_list = [];
    List list = json.decode(order.goods);
    list.forEach((v) {
      _goods_list.add(OrderGoodModel.fromJson(v));
    });

    return Card(
      child: InkWell(
        onTap: () {
          this._goOrderDetail(order);
        },
        child: Container(
          margin: EdgeInsets.all(
            ScreenUtil().setWidth(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: ScreenUtil().setHeight(80.0),
                child: Text(
                  order.username + ':' + order.mobile,
                  style: TextStyle(
                    color: KColor.ORDER_ITEM_TEXT_COLOR,
                    fontSize: ScreenUtil().setSp(26.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goOrderDetail(OrderModel orderModel) {}
}
