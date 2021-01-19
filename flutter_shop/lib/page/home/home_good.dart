import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_shop/utils/color_util.dart';
import 'package:flutter_shop/utils/router_util.dart';

class HomeGood extends StatefulWidget {
  List<HomeGoodModel> _goodsList;

  HomeGood(this._goodsList);

  @override
  _HomeGoodState createState() => _HomeGoodState();
}

class _HomeGoodState extends State<HomeGood> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: width,
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 7.5,
      ),
      child: _goodList(context, width, widget._goodsList),
    );
  }

  Widget _goodList(BuildContext context, double deviceWidth,
      List<HomeGoodModel> productList) {
    double width = deviceWidth * 168.5 / 360.0;
    double imageWidth = deviceWidth * 110.0 / 360.0;

    List<Widget> listWidgets = productList.map((item) {
      var bgColor = ColorUtil.string2Color('#f8f8f8');
      return InkWell(
        onTap: () {
          RouterUtil.toGoodDetailPage(context, "${item.id}");
        },
        child: Container(
          color: bgColor,
          width: width,
          margin: EdgeInsets.only(
            top: 5.0,
            bottom: 5,
            left: 2,
          ),
          padding: EdgeInsets.only(
            top: 10,
            left: 13,
            bottom: 7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name.length > 8 ? item.name.substring(0,8) : item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15.0,
                  color: KColor.PRIMARY_COLOR,
                ),
              ),
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15.0,
                  color: KColor.PRIMARY_COLOR,
                ),
              ),

              Container(
                alignment: Alignment(0,0),
                margin: EdgeInsets.only(top: 5.0),
                child: Image.network(
                  item.images.split(',')[0],
                  fit: BoxFit.contain,
                  width: imageWidth,
                  height: imageWidth,
                ),
              ),

              Row(
                children: [
                  Text(
                    '¥${item.discount_price}',
                    style: TextStyle(
                      color: KColor.PRICE_TEXT_COLOR,
                    ),
                  ),
                  Text(
                    '¥${item.price}',
                    style: TextStyle(
                      color: KColor.PRICE_TEXT_COLOR,
                      decoration: TextDecoration.lineThrough
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            KString.NEW_GOOD_TITLE,
            style: TextStyle(
              color: KColor.HOME_SUB_TITLE_COLOR,
              fontSize: 18,
            ),
          ),
        ),
        Wrap(
          spacing: 2,
          children: listWidgets,
        ),
      ],
    );
  }
}
