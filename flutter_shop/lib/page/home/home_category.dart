import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_shop/utils/router_util.dart';

class HomeCategory extends StatelessWidget {

  List<HomeCategoryModel> _list;
  HomeCategory(this._list);

  Widget _categoryItem(BuildContext context,HomeCategoryModel item){
    return InkWell(
      onTap: (){
        _goCategory(context, item.id);
      },
      child: Column(
        children: [
          Image.network(item.image,width: ScreenUtil().setWidth(95),),
          Text('${item.name}'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(_list.length >= 10){
      _list.removeRange(10, _list.length);
    }
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10.0),
      height: ScreenUtil().setHeight(240),
      padding: EdgeInsets.all(3.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: _list.length,
        padding: EdgeInsets.all(4.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: ScreenUtil().setWidth(10),
          crossAxisSpacing: ScreenUtil().setWidth(10)
        ),
        itemBuilder: (BuildContext context,int index){
          return _categoryItem(context, _list[index]);
        },
      ),
    );
  }

  void _goCategory(BuildContext context,int categoryId) async {
    RouterUtil.toCategoryGoodListPage(context, categoryId, 0);
  }
}
