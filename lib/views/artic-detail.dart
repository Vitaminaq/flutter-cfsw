import 'package:flutter/material.dart';
import '../component/webview/base-webview-page.dart';

// 文章详情
class ArticDetailState extends State<ArticDetail> {
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext content) {
    final dynamic params = ModalRoute.of(context).settings.arguments;
    final int id = params['id'];
    return BaseWebviewPage(
      initialUrl: 'http://192.168.1.102:8000/blog/detail?id=$id',
    );
  }
}

class ArticDetail extends StatefulWidget {
  @override
  ArticDetailState createState() => ArticDetailState();
}
