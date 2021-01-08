import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';

class LogoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = 200.0;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      color: KColor.PRIMARY_COLOR,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).cardColor,
                    blurRadius: 4.0,
                  ),
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/head.jpeg')
                )
              ),
            ),
            left: (width - 90) / 2.0,
            top: height - 45.0,
          ),
        ],
      ),
    );
  }
}
