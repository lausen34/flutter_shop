import 'package:flutter/material.dart';

class ItemTextField extends StatelessWidget {
  Icon icon; //图标
  TextEditingController controller; //控制器
  FocusNode focusNode; //焦点
  String title; //标题
  String hintText; //站位文本
  bool obscureText; //是否是密码框
  TextInputType keyboardType; //键盘的类型

  ItemTextField({
    this.icon,
    this.controller,
    this.focusNode,
    this.title,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Stack(
        children: [
          Positioned(
            //图标
            child: icon,
            left: 16,
            top: 8,
            height: 18,
          ),

          Positioned(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 14,
              ),
              obscureText: obscureText,
              keyboardType: keyboardType,
            ),
            left: 55,
            top: 10,
            right: 16,
            height: 30,
          ),
        ],
      ),
    );
  }
}
