import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/component/big_button.dart';
import 'package:flutter_shop/component/item_text_field.dart';
import 'package:flutter_shop/component/logo_container.dart';
import 'package:flutter_shop/component/small_button.dart';

void main() {
  return runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      child: MaterialApp(
        title: "电子商城",
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "电子商城",
            ),
          ),
          body: Container(
            child: Center(
                child: Column(
              children: [
                KSmallButton(
                  text: "去支付",
                  onPressed: () {
                    print('去支付');
                  },
                ),
                ItemTextField(
                  icon: Icon(Icons.blur_circular),
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                  title: "用户名",
                  hintText: '请输入用户名',
                  obscureText: false,
                ),

                SizedBox(height: 30,),

                LogoContainer(),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
