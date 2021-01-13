import 'package:flutter/material.dart';
import 'package:flutter_shop/config/index.dart';
import 'category_first.dart';
import 'category_second.dart';
import 'category_good_list_page.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(KString.CATEGORY_TITLE),
        ),
        body: Row(
          children: [
            CategoryFirst(),
            Expanded(
              child: CategorySecond(),
            ),
          ],
        ));
  }
}
