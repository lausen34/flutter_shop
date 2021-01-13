import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/home_content_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeBanner extends StatelessWidget {
  List<HomeBannerModel> _banners;

  HomeBanner(this._banners);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: _banners.length,
        itemBuilder: (context, index) {
          return Image.network(
            _banners[index].image,
            fit: BoxFit.cover,
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
