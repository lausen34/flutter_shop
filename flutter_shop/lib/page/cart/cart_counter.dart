import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notifiy.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/service/http_service.dart';

class CartCounter extends StatefulWidget {
  CartModel _item;

  CartCounter(this._item);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165.0),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: KColor.BORDER_COLOR,
        ),
      ),
      child: Row(
        children: [
          _reduceButton(context, widget._item),
          _goodCount(context, widget._item),
          _addButton(context, widget._item),
        ],
      ),
    );
  }

  Widget _reduceButton(BuildContext context, CartModel item) {
    return InkWell(
      onTap: () {
        this._goodCountUpdate(context, widget._item.good_count - 1);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: item.good_count > 1 ? Colors.white : KColor.BORDER_COLOR,
          border: Border(
            right: BorderSide(
              width: 1,
              color: KColor.BORDER_COLOR,
            ),
          ),
        ),
        child: item.good_count > 1 ? Text('-') : Text(''),
      ),
    );
  }

  Widget _goodCount(BuildContext context, CartModel item) {
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      child: Text('${item.good_count}'),
    );
  }

  Widget _addButton(BuildContext context, CartModel item) {
    return InkWell(
      onTap: () {
        this._goodCountUpdate(context, widget._item.good_count + 1);
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: KColor.BORDER_COLOR,
          border: Border(
            left: BorderSide(
              width: 1,
              color: KColor.BORDER_COLOR,
            ),
          ),
        ),
        child: Text('+'),
      ),
    );
  }

  void _goodCountUpdate(BuildContext context, int count) async {
    var params = {
      'id': widget._item.id,
      'good_count': count,
      'is_checked': widget._item.is_checked,
    };
    var response = await HttpService.post(ApiUrl.CART_UPDATE, params: params);
    if (response != null && response['code'] == 0) {
      Call.dispatch(Notify.RELOAD_CART_LIST);
    }
  }
}
