import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/component/circle_check_box.dart';
import 'package:flutter_shop/component/small_button.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/data/data_center.dart';

class CartSettleAccount extends StatefulWidget {
  @override
  _CartSettleAccountState createState() => _CartSettleAccountState();
}

class _CartSettleAccountState extends State<CartSettleAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _allCheckBox(context),
          _allPriceContainer(context),
          _settleButton(context),
        ],
      ),
    );
  }

  Widget _allCheckBox(BuildContext context) {
    bool isAllChecked = false;
    return Container(
      child: Row(
        children: [
          CircleCheckBox(
            value: isAllChecked,
            onChanged: (isChecked) {
              print(isChecked);
            },
          ),
          Text(KString.CHECK_ALL),
        ],
      ),
    );
  }

  Widget _settleButton(BuildContext context) {
    int _goodCount = 0;
    DataCenter.getInstance().cartList.forEach((cartModel) {
      if (cartModel.is_checked == 1) {
        _goodCount += cartModel.good_count;
      }
    });
    return KSmallButton(
      text: KString.SETTLE_ACCOUNT + '(${_goodCount})',
      onPressed: () {},
    );
  }

  Widget _allPriceContainer(BuildContext context) {
    int _allPrice = 0;
    DataCenter.getInstance().cartList.forEach((cartModel) {
      if (cartModel.is_checked == 1) {
        _allPrice += (cartModel.good_price * cartModel.good_count);
      }
    });
    return Container(
      width: ScreenUtil().setWidth(430),
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: ScreenUtil().setWidth(200.0),
            child: Text(
              KString.ALL_PRICE,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: ScreenUtil().setWidth(230),
            child: Text(
              '(¥$_allPrice)',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color: KColor.PRICE_TEXT_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
