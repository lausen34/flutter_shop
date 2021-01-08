import 'package:flutter/material.dart';
import 'package:flutter_shop/config/color.dart';

class CircleCheckBox extends StatefulWidget {
  bool value = false;
  Function onChanged;

  CircleCheckBox({
    this.value,
    this.onChanged,
  });

  @override
  _CircleCheckBoxState createState() => _CircleCheckBoxState();
}

class _CircleCheckBoxState extends State<CircleCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          widget.value = !widget.value; //值的改变
          widget.onChanged(widget.value); //改变值之后的回调
        },
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: widget.value ?
          Icon(
            Icons.check_circle,
            size: 28,
            color: KColor.PRIMARY_COLOR,
          ) :
          Icon(
            Icons.panorama_fish_eye,
            size: 28,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
