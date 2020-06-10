import 'package:flutter/material.dart';
import './base-webview.dart';

// webview页面
class BaseWebviewPageState extends State<BaseWebviewPage> {
  String pageTitle = '';

  @override
  Widget build(BuildContext content) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffffff),
        centerTitle: true,
        title: Text(
          pageTitle,
          style: TextStyle(color: Color(0xFF333333)),
        ),
      ),
      body: Builder(builder: (BuildContext context) {
        return BaseWebview(
            initialUrl: widget.initialUrl,
            finishedCallback: (String title) {
              setState(() {
                pageTitle = title;
              });
            });
      }),
    );
  }
}

class BaseWebviewPage extends StatefulWidget {
  BaseWebviewPage({Key key, @required this.initialUrl}) : super(key: key);

  final String initialUrl; // webview地址

  @override
  BaseWebviewPageState createState() => BaseWebviewPageState();
}
