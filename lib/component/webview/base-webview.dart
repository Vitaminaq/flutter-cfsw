import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/publics.dart';
import './service.dart';

class BaseWebviewState<S> extends State<BaseWebview> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('我就不更新视图，哈哈哈');
    return;
  }

  @override
  Widget build(BuildContext content) {
    int pageStartTime;
    WebViewController _controller;

    JavascriptChannel _jsBridge(BuildContext context) {
      return JavascriptChannel(
          name: 'cfsw', // 与h5 端的一致 不然收不到消息
          onMessageReceived: (JavascriptMessage msg) {
            String jsonStr = msg.message;
            print('从h5接受到的信息 $jsonStr');
            responseAction(ResponseActionOptions<S>(
                jsonStr: jsonStr,
                context: context,
                controller: _controller,
                url: widget.initialUrl,
                prefetchData: widget.prefetchData,
                storeModule: widget.storeModule,
                fatherContext: widget.fatherContext));
          });
    }

    return WebView(
      initialUrl: widget.initialUrl,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller = webViewController;

        final duration =
            DateTime.now().millisecondsSinceEpoch - widget.startTime;
        print('webview创建耗时: $duration s');
      },
      onPageStarted: (String url) {
        print('页面开始加载: $url');
        pageStartTime = DateTime.now().millisecondsSinceEpoch;
      },
      onPageFinished: (String url) async {
        final duration = DateTime.now().millisecondsSinceEpoch - pageStartTime;
        print('页面加载耗时: $duration');
        // 设置页面标题
        _controller.evaluateJavascript("document.title").then((result) {
          widget.finishedCallback(result);
        });
        final String token = await getToken();
        // print('向h5同步的信息 $token');
        // 向h5同步登陆态信息
        // final dynamic params = "{'token': '$token'}";
        // _controller.evaluateJavascript("app.getSyncAppState($params)");
      },
      gestureNavigationEnabled: true,
      debuggingEnabled: true,
      javascriptChannels: <JavascriptChannel>[
        _jsBridge(context) // 与h5 通信
      ].toSet(),
    );
  }
}

class BaseWebview<S> extends StatefulWidget {
  BaseWebview(
      {Key key,
      this.initialUrl,
      this.prefetchData,
      this.finishedCallback,
      this.fatherContext,
      this.storeModule})
      : super(key: key);

  final String initialUrl;
  final dynamic prefetchData;
  final int startTime = DateTime.now().millisecondsSinceEpoch;
  final finishedCallback;
  final S storeModule;
  final dynamic fatherContext;

  @override
  BaseWebviewState createState() => BaseWebviewState<S>();
}
