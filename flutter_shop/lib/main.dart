import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/component/circle_check_box.dart';
import 'package:flutter_shop/component/item_text_field.dart';
import 'package:flutter_shop/component/logo_container.dart';
import 'package:flutter_shop/component/small_button.dart';
import 'package:flutter_shop/utils/random_util.dart';
import 'package:flutter_shop/utils/color_util.dart';
import 'utils/router_util.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var onChanged = false;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      child: MaterialApp(
        title: '我的app',
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "电子商城",
            ),
          ),
          body: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var onChanged = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(
            height: 30,
          ),
          LogoContainer(),
          SizedBox(
            height: 50,
          ),
          CircleCheckBox(
            value: onChanged,
            onChanged: (value) {
              setState(() {
                onChanged = value;
              });
            },
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "${RandomUtil.randomNumeric(5)}",
            style: TextStyle(
              color: ColorUtil.string2Color("#FF35C8"),
              fontSize: 24,
            ),
          ),
          FloatingActionButton(onPressed: (){
            RouterUtil.toLoginPage(context,'Lausen');
          })
        ],
      ),
    );
  }
}
