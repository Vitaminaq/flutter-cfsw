import 'package:flutter/material.dart';
import 'base-webview-loading.dart';
import 'base-webview.dart';
import 'base-webview-pure.dart';

// webview页面
class BaseWebviewPageState extends State<BaseWebviewPage> {
  String pageTitle = '';
  int currentIndex = 0;

  @override
  Widget build(BuildContext content) {
    return widget.hasAppBar == false
        ? Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Builder(builder: (BuildContext context) {
              return SafeArea(
                  top: true,
                  child: IndexedStack(
                    index: currentIndex,
                    children: <Widget>[
                      BaseWebviewLoading(),
                      widget.pure == true
                          ? BaseWebviewPure(
                              initialUrl: widget.initialUrl,
                              finishedCallback: (int index) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            )
                          : BaseWebview(
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
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            resizeToAvoidBottomPadding: false,
            body: Builder(builder: (BuildContext context) {
              return SafeArea(
                  top: true,
                  child: IndexedStack(
                    index: currentIndex,
                    children: <Widget>[
                      BaseWebviewLoading(),
                      widget.pure == true
                          ? BaseWebviewPure(
                              initialUrl: widget.initialUrl,
                              finishedCallback: (int index) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            )
                          : BaseWebview(
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

  @override
  void dispose() {
    super.dispose();
  }
}

class BaseWebviewPage<S> extends StatefulWidget {
  BaseWebviewPage(
      {Key key,
      @required this.initialUrl,
      this.prefetchData,
      this.pure = false,
      this.hasAppBar = false,
      this.statusBarColor})
      : super(key: key);

  final String initialUrl; // webview地址
  final dynamic prefetchData; // 预请求的数据
  final bool pure;
  final bool hasAppBar;
  final int statusBarColor;

  @override
  BaseWebviewPageState createState() => BaseWebviewPageState();
}
