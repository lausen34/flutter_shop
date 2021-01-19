import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/user/member_page.dart';
import '../page/user/login_page.dart';
import '../page/category/category_good_list_page.dart';
import '../page/user/register_page.dart';

class RouterUtil {

  static var routerNames = {
    'memberPage':MemberPage,
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

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
