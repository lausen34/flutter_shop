import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/call/notifiy.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/utils/router_util.dart';

class CategorySecond extends StatefulWidget {
  @override
  _CategorySecondState createState() => _CategorySecondState();
}

class _CategorySecondState extends State<CategorySecond> {
  List<CategoryModel> _secondList = [];
  int _firstCategoryId = 0;
  int _secondCategoryId = 0;

  @override
  void initState() {
    super.initState();
    Call.addCallBack(Notify.REFRESH_SECOND_CATEGORY, _refreshCategory);
  }

  void _refreshCategory(data) {
    setState(() {
      _firstCategoryId = data['firstCategoryId'];
    });
    _getSecondCategory(data['firstCategoryId']);
  }

  _getSecondCategory(int id) async {
    var response =
        await HttpService.get(ApiUrl.CATEGORY_SECOND, params: {'pid': id});
    CategoryListModel model = CategoryListModel.fromJson(response['data']);
    model.list.forEach((element) {
      print(element.name);
    });
    if (model.list.length > 0) {
      var secondId = model.list[0].id;
      setState(() {
        _secondList = model.list;
        _secondCategoryId = secondId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 20.0,
            ),
          ),

          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: _secondList.length,
            shrinkWrap: true,
            padding: EdgeInsets.all(4.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
            ),
            itemBuilder: (context,index){
                return _categoryItem(_secondList[index]);
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget _categoryItem(CategoryModel categoryModel) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _secondCategoryId = categoryModel.id;
        });
        this._goCategoryPage(context, _firstCategoryId, _secondCategoryId);
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.network(
              categoryModel.image,
              fit: BoxFit.cover,
              height: 60,
            ),
            Text(
              categoryModel.name,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goCategoryPage(BuildContext context,int firstCategoryId,int secondCategoryId){
    RouterUtil.toCategoryGoodListPage(context, firstCategoryId, secondCategoryId);
  }
}
