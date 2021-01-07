import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_screenutil/screenutil.dart';

class KSmallButton extends StatelessWidget {
  String text;
  Function onPressed;

  KSmallButton({String text, Function onPressed}) {
    this.text = text;
    this.onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(160),
      height: 42,
      child: InkWell(
        onTap: () {
          this.onPressed();
        },
        child: Container(
          padding: EdgeInsets.all(0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: KColor.BUY_BUTTON_COLOR,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Text(
            this.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
