import 'package:flutter/material.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/call/notifiy.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/config/index.dart';

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

  void _refreshCategory(data){
    setState(() {
      _firstCategoryId = data['firstCategoryId'];
    });
    _getSecondCategory(data['firstCategoryId']);
  }
  
  _getSecondCategory(int id) async{
    var response = await HttpService.get(ApiUrl.CATEGORY_SECOND,params: {'pid': id});
    CategoryListModel model = CategoryListModel.fromJson(response['data']);
    model.list.forEach((element) {
      print(element.name);
    });
    if (model.list.length > 0){
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
      child: Text('二级分类'),
    );
  }
}
