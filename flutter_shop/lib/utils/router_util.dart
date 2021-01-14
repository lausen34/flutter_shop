import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../page/user/login_page.dart';
import '../page/category/category_good_list_page.dart';

class RouterUtil {
  static toLoginPage(BuildContext context, String username) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LoginPage(
              username: username,
            ),
      ),
    );
  }

  static toCategoryGoodListPage(BuildContext context, int firstCategoryId,
      int secondCategoryId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CategoryGoodListPage(
              firstCategoryId,
              secondCategoryId,
            ),
      ),
    );
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
