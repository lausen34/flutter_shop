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
              ListView.builder(
                shrinkWrap: true,
                itemCount: _goods_list.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return this._goodItem(_goods_list[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _goodItem(OrderGoodModel good) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            good.good_image ?? '',
            width: ScreenUtil().setWidth(160.0),
            height: ScreenUtil().setHeight(160.0),
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(20.0),
              right: ScreenUtil().setWidth(20.0),
            ),
            child: Text(
              'X${good.good_name.substring(0, 10)}',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(26.0),
                color: KColor.ORDER_ITEM_TEXT_COLOR,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: ScreenUtil().setWidth(150),
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(20.0),
                right: ScreenUtil().setWidth(20.0),
              ),
              child: Column(
                children: [
                  Text(
                    '${good.good_price}',
                    style: TextStyle(
                      color: KColor.ORDER_ITEM_TEXT_COLOR,
                      fontSize: ScreenUtil().setSp(24.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(20.0),
                    ),
                  ),
                  Text(
                    'X${good.good_count}',
                    style: TextStyle(
                      color: KColor.ORDER_ITEM_TEXT_COLOR,
                      fontSize: ScreenUtil().setSp(24.0),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _goOrderDetail(OrderModel orderModel) {}
}
