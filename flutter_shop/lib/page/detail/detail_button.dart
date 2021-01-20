import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/component/medium_button.dart';
import 'package:flutter_shop/component/show_message.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/good_detail_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/utils/router_util.dart';
import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notifiy.dart';

class DetailButton extends StatelessWidget {
  GoodDetailModel _goodDetailModel;

  DetailButton(this._goodDetailModel);

  @override
  Widget build(BuildContext context) {
    if (_goodDetailModel != null) {
      return Container(
        color: Colors.white,
        width: ScreenUtil().setWidth(750.0),
        height: ScreenUtil().setHeight(80.0),
        child: Row(
          children: [
            Container(
              width: ScreenUtil().setWidth(110),
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_cart,
                size: 35,
                color: KColor.PRIMARY_COLOR,
              ),
            ),
            KMediumButton(
              text: KString.ADD_TO_CART,
              color: KColor.ADD_TO_CART_COLOR,
              onPressed: () {
                _addGoodToCart(
                  context,
                  _goodDetailModel,
                );
              },
            ),
            SizedBox(
              width: 20,
              height: 70,
            ),
            KMediumButton(
              text: KString.BUY_GOOD,
              color: KColor.BUY_NOW_BUTTON_COLOR,
              onPressed: () {
                //TODO 立即购买时间
              },
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

  void _addGoodToCart(
    BuildContext context,
    GoodDetailModel goodDetailModel,
  ) async {
    if (!(await TokenUtil.isLogin())) {
      RouterUtil.toLoginPage(context);
      return;
    }
    var user = await TokenUtil.getUserInfo();
    var params = {
      'user_id': user.id,
      'good_id': this._goodDetailModel.id,
      'good_count': 1,
      'good_name': this._goodDetailModel.name,
      'good_price': this._goodDetailModel.price,
      'good_image': this._goodDetailModel.images.split(',')[0],
    };
    var response = await HttpService.post(ApiUrl.CART_ADD, params: params);
    if (response['code'] == 0) {
      MessageWiddget.show(
        KString.ADD_SUCCESS,
      );
      Call.dispatch(
        Notify.RELOAD_CART_LIST,
        data: _goodDetailModel,
      );
    } else {}
  }
}
