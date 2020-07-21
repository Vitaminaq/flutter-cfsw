import 'package:flutter/material.dart';
import './base-webview-loading.dart';
import './base-webview.dart';

// webview页面
class BaseWebviewPageState extends State<BaseWebviewPage> {
  String pageTitle = '';
  int currentIndex = 0;

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
            child: IndexedStack(
              index: currentIndex,
              children: <Widget>[
                BaseWebviewLoading(),
                BaseWebview(
                    initialUrl: widget.initialUrl,
                    prefetchData: widget.prefetchData,
                    finishedCallback: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    }),
                // BaseWebviewFail()
              ],
            ));
      }),
    );
  }
}

class BaseWebviewPage<S> extends StatefulWidget {
  BaseWebviewPage({
    Key key,
    @required this.initialUrl,
    this.prefetchData,
  }) : super(key: key);

  final String initialUrl; // webview地址
  final dynamic prefetchData; // 预请求的数据

  @override
  BaseWebviewPageState createState() => BaseWebviewPageState();
}
