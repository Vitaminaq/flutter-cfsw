import 'package:flutter/material.dart';

/**
 * 文章详情
 */
class ArticDetailState extends State<ArticDetail> {
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext content) {
    return Scaffold(
        // header
        appBar: AppBar(
            backgroundColor: Color(0xFFffffff),
            centerTitle: true,
            title: Text(
              '文章详情页',
              style: TextStyle(color: Color(0xFF333333)),
            )),
        body: SafeArea(child: Text('1233')));
  }
}

class ArticDetail extends StatefulWidget {
  @override
  ArticDetailState createState() => ArticDetailState();
}
