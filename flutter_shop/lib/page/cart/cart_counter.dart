import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:flutter_shop/model/cart_model.dart';

class CartCounter extends StatefulWidget {
  CartModel _item;
  CartCounter(this._item);
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: KColor.BORDER_COLOR,
          ),
        ),
      ),
      child: Row(
        children: [

        ],
      ),
    );
  }
}
