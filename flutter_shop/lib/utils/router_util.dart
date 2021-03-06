import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/model/order_model.dart';
import 'package:flutter_shop/page/detail/good_detail_page.dart';
import 'package:flutter_shop/page/order/order_info_page.dart';
import 'package:flutter_shop/page/order/order_list_page.dart';
import 'package:flutter_shop/page/user/member_page.dart';
import '../page/user/login_page.dart';
import '../page/category/category_good_list_page.dart';
import '../page/user/register_page.dart';
import '../page/order/write_order_page.dart';

class RouterUtil {
  static var routerNames = {
    'memberPage': MemberPage,
  };

  static toLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  static toCategoryGoodListPage(
      BuildContext context, int firstCategoryId, int secondCategoryId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryGoodListPage(
          firstCategoryId,
          secondCategoryId,
        ),
      ),
    );
  }

  static toRegisterPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }

  static toMemberPage(BuildContext context) {
    Navigator.pop(context);
  }

  static toGoodDetailPage(BuildContext context, String goodId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoodDetailPage(goodId),
      ),
    );
  }

  static toWriteOrderPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WriteOrderPage(),
      ),
    );
  }

  static toOrderListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderListPage(),
      ),
    );
  }

  static toOrderInfoPage(BuildContext context, OrderModel orderModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderInfoPage(orderModel),
      ),
    );
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
