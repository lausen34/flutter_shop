import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/good_detail_model.dart';

class DetailInfo extends StatelessWidget {
  GoodDetailModel _goodDetailModel;

  DetailInfo(this._goodDetailModel);

  @override
  Widget build(BuildContext context) {
    if (_goodDetailModel != null) {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.all(2.0),
        child: Column(
          children: [
            _goodImage(_goodDetailModel.images.split(',')[0]),
            _goodName(_goodDetailModel.name),
            _goodSN(_goodDetailModel.good_sn),
            _goodPrice(
              _goodDetailModel.discount_price,
              _goodDetailModel.price,
            ),
          ],
        ),
      );
    } else {
      return Text(
        KString.LOADING,
      );
    }
  }

  Widget _goodImage(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      width: ScreenUtil().setWidth(740),
    );
  }

  Widget _goodName(String name) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30.0),
        ),
      ),
    );
  }

  Widget _goodSN(int num) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(
        left: 15.0,
      ),
      child: Text(
        KString.GOOD_SN + '$num',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30.0),
          color: KColor.GOOD_SN_COLOR,
        ),
      ),
    );
  }

  Widget _goodPrice(int discount_price, int price) {
    return Container(
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Text(
            "¥$discount_price",
            style: TextStyle(
              color: KColor.PRICE_TEXT_COLOR,
              fontSize: ScreenUtil().setSp(
                40.0,
              ),
            ),
          ),
          Text(
            KString.ORI_PRICE + "$price",
            style: TextStyle(
              color: KColor.OLD_PRICE_COLOR,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
