import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notifiy.dart';
import 'package:flutter_shop/config/api_url.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:flutter_shop/model/cart_model.dart';
import 'package:flutter_shop/component/circle_check_box.dart';
import 'package:flutter_shop/service/http_service.dart';

class CartGoodItem extends StatelessWidget {
  final CartModel item;

  CartGoodItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: KColor.BORDER_COLOR,
          ),
        ),
      ),
      child: Row(
        children: [
          _cartCheckBox(context, this.item),
          _cartGoodImage(this.item),
          _cartGoodPrice(context, this.item),
        ],
      ),
    );
  }

  Widget _cartCheckBox(BuildContext context, CartModel item) {
    return Container(
      width: ScreenUtil().setWidth(100),
      child: Center(
        child: CircleCheckBox(
          value: item.is_checked == 1 ? true : false,
          onChanged: (bool is_checked) {
            int isChecked = is_checked ? 1 : 0;
            this._goodCheckedUpdate(context, isChecked);
          },
        ),
      ),
    );
  }

  Widget _cartGoodImage(CartModel item) {
    return Container(
      padding: EdgeInsets.all(3.0),
      width: ScreenUtil().setWidth(150),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: KColor.BORDER_COLOR,
        ),
      ),
      child: Image.network(
        item.good_image,
        fit: BoxFit.cover,
      ),
    );
  }

  

  Widget _cartGoodPrice(BuildContext context, CartModel item) {
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          Text(
            '¥${item.good_price}',
            style: TextStyle(
              color: KColor.PRICE_TEXT_COLOR,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: InkWell(
              onTap: () {
                this._goodDeleteUpdata(context, item.id);
              },
              child: Icon(
                Icons.delete,
                color: KColor.CART_DELETE_ICON_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _goodCheckedUpdate(BuildContext context, int is_checked) async {
    var params = {
      'id': this.item.id,
      'good_count': this.item.good_count,
      'is_checked': is_checked
    };
    var response = await HttpService.post(ApiUrl.CART_UPDATE, params: params);
    if (response != null && response['code'] == 0) {
      Call.dispatch(Notify.RELOAD_CART_LIST);
    }
  }

  void _goodDeleteUpdata(BuildContext context,int id) async{
    var params = {
      'id': id,
    };
    var response = await HttpService.post(ApiUrl.CART_DELETE,params: params);
    if(response != null && response['code'] == 0){
      Call.dispatch(Notify.RELOAD_CART_LIST);
    }
  }
}
