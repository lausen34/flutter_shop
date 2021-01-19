import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/good_detail_model.dart';
import 'package:flutter_shop/page/detail/detail_info.dart';
import 'package:flutter_shop/service/http_service.dart';
import 'package:flutter_shop/utils/router_util.dart';

class GoodDetailPage extends StatefulWidget {
  String _goodId;

  GoodDetailPage(this._goodId);

  @override
  _GoodDetailPageState createState() => _GoodDetailPageState();
}

class _GoodDetailPageState extends State<GoodDetailPage> {
  GoodDetailModel _goodDetailModel = null;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    var params = {
      'id': widget._goodId,
    };
    var response = await HttpService.get(
      ApiUrl.GOOD_DETAIL,
      params: params,
    );
    this.setState(() {
      _goodDetailModel = GoodDetailModel.fromJson(
        response['data'],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              RouterUtil.pop(context);
            },
          ),
          title: Text(
            KString.GOOD_DETAIL_TITLE,
          ),
        ),
        body: (_goodDetailModel != null)
            ? Stack(
                children: [
                  ListView(
                    children: [
                      DetailInfo(
                        _goodDetailModel,
                      ),
                      Html(
                        data: _goodDetailModel.detail.toString(),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Text(''),
                  ),
                ],
              )
            : Text(
                KString.LOADING,
              ),
      ),
    );
  }
}
