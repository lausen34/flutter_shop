import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/call/call.dart';
import 'package:flutter_shop/component/show_message.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/cate_good_model.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/utils/router_util.dart';

class CategoryGoodListPage extends StatefulWidget {
  int _firstCategoryId = 0;
  int _secondCategoryId = 0;

  CategoryGoodListPage(this._firstCategoryId, this._secondCategoryId);

  @override
  _CategoryGoodListPageState createState() => _CategoryGoodListPageState();
}

class _CategoryGoodListPageState extends State<CategoryGoodListPage> {
  List<CategoryGoodModel> _goodList = [];
  int _pageIndex = 1;
  int _pageSize = 4;
  bool _noMoreData = false;

  GlobalKey _footerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _getGoodList();
    print(widget._firstCategoryId);
    print(widget._secondCategoryId);
  }

  void _getGoodList() async {
    var params = {
      'category_first': widget._firstCategoryId,
      'category_second': widget._secondCategoryId,
      'page_index': _pageIndex,
      'page_size': _pageSize,
    };

    var response =
        await HttpService.get(ApiUrl.CATEGORY_GOOD_LIST, params: params);
    CategoryGoodListModel model =
        CategoryGoodListModel.fromJson(response['data']);
    model.list.forEach((element) {
      print(element.name);
    });
    this.setState(() {
      _goodList = model.list;
      _noMoreData = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(KString.GOOD_LIST_TITLE),
      ),
      body: _goodList.length > 0
          ? Container(
              width: width,
              child: EasyRefresh(
                footer: ClassicalFooter(
                  key: _footerKey,
                  bgColor: Colors.white,
                  textColor: KColor.REFRESH_TEXT_COLOR,
                  infoColor: KColor.REFRESH_TEXT_COLOR,
                  infoText: KString.LOADING,
                  noMoreText: _noMoreData ? KString.NO_MORE_DATA : "",
                  loadReadyText: KString.LOAD_READY_TEXT,
                ),
                header: ClassicalHeader(),
                child: ListView.builder(
                  controller: ScrollController(),
                  itemCount: _goodList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _goodListItem(_goodList, index);
                  },
                ),
                onLoad: () async {
                  if (_noMoreData) {
                    MessageWiddget.show(
                      KString.TO_BOTTOM,
                    );
                  } else {
                    this._getMoreData();
                  }
                },
              ),
            )
          : Center(
              child: Text(KString.NO_MORE_DATA),
            ),
    );
  }

  void _getMoreData() async {
    _pageIndex++;
    var params = {
      'category_first': widget._firstCategoryId,
      'category_second': widget._secondCategoryId,
      'page_index': _pageIndex,
      'page_size': _pageSize,
    };

    var response =
        await HttpService.get(ApiUrl.CATEGORY_GOOD_LIST, params: params);
    CategoryGoodListModel model =
        CategoryGoodListModel.fromJson(response['data']);

    if (model.list != null && model.list.length > 0) {
      _goodList.addAll(model.list);
      this.setState(() {
        _goodList = _goodList;
        _noMoreData = false;
      });
    } else {
      _noMoreData = true;
    }
  }

  Widget _goodListItem(List<CategoryGoodModel> goodList, int index) {
    return InkWell(
      onTap: () {
        RouterUtil.toGoodDetailPage(context, "${goodList[index].id}");
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: KColor.BORDER_COLOR,
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10.0,
            ),
            _goodImage(
              _goodList[index],
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              children: [
                _goodName(
                  _goodList[index],
                ),
                _goodPrice(
                  _goodList[index],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _goodImage(CategoryGoodModel model) {
    return Container(
      width: ScreenUtil().setWidth(160),
      child: Image.network(
        model.images.split(',')[0],
      ),
    );
  }

  Widget _goodName(CategoryGoodModel model) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        model.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(28),
        ),
      ),
    );
  }

  Widget _goodPrice(CategoryGoodModel model) {
    return Container(
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        padding: EdgeInsets.all(5.0),
        width: ScreenUtil().setWidth(370),
        child: Row(
          children: [
            Text(
              KString.GOOD_LIST_PRICE + '${model.discount_price}',
              style: TextStyle(
                color: KColor.PRICE_TEXT_COLOR,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "¥${model.price}",
              style: KFont.PRICE_STYLE,
            ),
          ],
        ));
  }
}
