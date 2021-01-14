import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/call/notifiy.dart';

class CategoryFirst extends StatefulWidget {
  @override
  _CategoryFirstState createState() => _CategoryFirstState();
}

class _CategoryFirstState extends State<CategoryFirst> {
  List<CategoryModel> _firstList = [];
  int _firstCategoryId = 0;

  @override
  void initState() {
    super.initState();
    _getFirstCategory();
  }

  _getFirstCategory() async {
    var response = await HttpService.get(ApiUrl.CATEGORY_FIRST);
    CategoryListModel model = CategoryListModel.fromJson(response['data']);
    var id = model.list[0].id;
    setState(() {
      _firstList = model.list;
      _firstCategoryId = id;
    });
    Call.dispatch(
      Notify.REFRESH_SECOND_CATEGORY,
      data: {'firstCategoryId': id},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      color: Colors.white,
      child: ListView.builder(
        itemCount: _firstList.length,
        itemBuilder: (BuildContext context, int index) {
          return _categoryItem(_firstList, index);
        },
      ),
    );
  }

  Widget _categoryItem(List<CategoryModel>list, int index) {
    bool _isSelected = (list[index].id == _firstCategoryId);
    return InkWell(
      onTap: () async {
        int id = list[index].id;
        setState(() {
          _firstCategoryId = id;
        });
        Call.dispatch(
          Notify.REFRESH_SECOND_CATEGORY,
          data: {'firstCategoryId': id},
        );
      },
      child: Container(
        height: ScreenUtil().setHeight(80.0),
        padding: EdgeInsets.only(
          left: 10,
          top: 10,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: _isSelected ? KColor.PRIMARY_COLOR : Colors.white,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          list[index].name,
          style: TextStyle(
            color: _isSelected ? KColor.PRIMARY_COLOR : Colors.grey,
            fontSize: ScreenUtil().setSp(28)
          ),
        ),
      ),
    );
  }
}
