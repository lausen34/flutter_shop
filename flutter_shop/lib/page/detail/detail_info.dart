import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/good_detail_model.dart';

class DetailInfo extends StatelessWidget {
  GoodDetailModel _goodDetailModel;

  DetailInfo(this._goodDetailModel);

  @override
  Widget build(BuildContext context) {
    if (_goodDetailModel != null) {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.all(2.0),
        child: Column(
          children: [
            _goodImage(_goodDetailModel.images.split(',')[0]),
          ],
        ),
      );
    } else {
      return Text(
        KString.LOADING,
      );
    }
  }

  Widget _goodImage(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      width: ScreenUtil().setWidth(740),
    );
  }
}
