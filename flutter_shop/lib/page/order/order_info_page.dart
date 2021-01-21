import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'package:flutter_shop/model/order_model.dart';

class OrderInfoPage extends StatefulWidget {
  OrderModel model;
  OrderInfoPage(this.model);
  @override
  _OrderInfoPageState createState() => _OrderInfoPageState();
}

class _OrderInfoPageState extends State<OrderInfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(KString.ORDER_DETAIL),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          KString.ORDER_DETAIL,
        ),
      ),
    );
  }
}
