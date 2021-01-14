import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/cate_good_model.dart';

class CategoryGoodListPage extends StatefulWidget {
  int _firstCategoryId = 0;
  int _secondCategoryId = 0;

  CategoryGoodListPage(this._firstCategoryId, this._secondCategoryId);

  @override
  _CategoryGoodListPageState createState() => _CategoryGoodListPageState();
}

class _CategoryGoodListPageState extends State<CategoryGoodListPage> {
  List<CategoryGoodListModel> _goodList = [];
  int pageIndex = 1;
  int _pageSize = 4;

  @override
  void initState() {
    super.initState();
    _getGoodList();
  }

  void _getGoodList() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(KString.GOOD_LIST_TITLE),
      ),
      body: Container(),
    );
  }
}
