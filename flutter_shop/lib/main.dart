import 'package:flutter/material.dart';
void main(){
  return runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "电子商城",
      home: Scaffold(
        appBar: AppBar(title: Text("电子商城",),),
        body: Container(
          child: Center(
            child: Text("fuck"),
          ),
        ),
      ),
    );
  }
}
