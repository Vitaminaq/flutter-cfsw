import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/publics.dart';
import './service.dart';

class BaseWebviewState extends State<BaseWebview> {
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
            responseAction(ResponseActionOptions(
                jsonStr: jsonStr,
                context: context,
                controller: _controller,
                url: widget.initialUrl));
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
        // // 设置页面标题
        // _controller.evaluateJavascript("document.title").then((result) {
        //   print('页面标题： $result');
        //   widget.finishedCallback(result);
        // });
        final String token = await getToken();
        print('向h5同步的信息 $token');
        // 向h5同步登陆态信息
        final params = "{'token': '$token'}";
        _controller
            .evaluateJavascript("app.getSyncAppState($params)")
            .then((result) {
          print('h5接受的token信息 $result');
        });
      },
      gestureNavigationEnabled: true,
      debuggingEnabled: true,
      javascriptChannels: <JavascriptChannel>[
        _jsBridge(context) // 与h5 通信
      ].toSet(),
    );
  }
}

class BaseWebview extends StatefulWidget {
  BaseWebview({Key key, this.initialUrl, this.finishedCallback})
      : super(key: key);

  final String initialUrl;
  final int startTime = DateTime.now().millisecondsSinceEpoch;
  final finishedCallback;

  @override
  BaseWebviewState createState() => BaseWebviewState();
}
