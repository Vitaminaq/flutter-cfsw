import 'package:flutter/material.dart';

// webview加载失败页面
class BaseWebviewFail extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return Container(
      child: Center(
          child: Column(children: [
        Text('网页加载失败', style: TextStyle(color: Color(0xbcbcbc))),
      ])),
    );
  }
}
