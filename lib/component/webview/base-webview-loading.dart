import 'package:flutter/material.dart';

// webview加载中页面
class BaseWebviewLoading extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return Container(
      child: Center(
          child: Text(
        '精彩内容马上呈现...',
        style: TextStyle(color: Color(0xFF00dcFF)),
      )),
    );
  }
}
