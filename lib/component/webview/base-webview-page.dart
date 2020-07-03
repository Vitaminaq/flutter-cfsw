import 'package:flutter/material.dart';
import './base-webview.dart';

// webview页面
class BaseWebviewPageState<S> extends State<BaseWebviewPage> {
  String pageTitle = '';

  @override
  Widget build(BuildContext content) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFFffffff),
      //   centerTitle: true,
      //   title: Text(
      //     pageTitle,
      //     style: TextStyle(color: Color(0xFF333333)),
      //   ),
      // ),
      resizeToAvoidBottomPadding: false,
      body: Builder(builder: (BuildContext context) {
        return SafeArea(
            top: true,
            child: BaseWebview<S>(
                initialUrl: widget.initialUrl,
                prefetchData: widget.prefetchData,
                storeModule: widget.storeModule,
                fatherContext: widget.fatherContext,
                finishedCallback: (String title) {
                  setState(() {
                    pageTitle = title;
                  });
                }));
      }),
    );
  }
}

class BaseWebviewPage<S> extends StatefulWidget {
  BaseWebviewPage(
      {Key key,
      @required this.initialUrl,
      this.prefetchData,
      this.storeModule,
      this.fatherContext})
      : super(key: key);

  final String initialUrl; // webview地址
  final dynamic prefetchData; // 预请求的数据
  final S storeModule; // 绑定的store
  final dynamic fatherContext; // 父组件

  @override
  BaseWebviewPageState createState() => BaseWebviewPageState<S>();
}
