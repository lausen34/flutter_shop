import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';

class KBigButton extends StatelessWidget {
  String text;
  Function onPressed;

  KBigButton({String text, Function onPressed}) {
    this.text = text;
    this.onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width - 20,
      height: 48.0,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        color: KColor.PRIMARY_COLOR,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24))),
      ),
    );
  }
}
