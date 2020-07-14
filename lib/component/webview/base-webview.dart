import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/publics.dart';
import './service.dart';

class BaseWebviewState extends State<BaseWebview> {
  WebViewController _controller;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   print('我就不更新视图，哈哈哈');
  //   return;
  // }

  Future<bool> _goBack(BuildContext context) async {
    if (_controller != null && await _controller.canGoBack()) {
      _controller.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext content) {
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
                url: widget.initialUrl,
                prefetchData: widget.prefetchData));
          });
    }

    return WillPopScope(
      child: WebView(
        initialUrl: widget.initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) async {
          widget.finishedCallback(1);
          final String token = await getToken();
          // 向h5同步登陆态信息
          final dynamic params = "{'code': 10000, 'token': '$token'}";
          _controller
              .evaluateJavascript("app.getSyncAppState($params)")
              .then((result) {
            print('h5接受到的信息 $params');
          });
        },
        gestureNavigationEnabled: true,
        debuggingEnabled: true,
        javascriptChannels: <JavascriptChannel>[
          _jsBridge(context) // 与h5 通信
        ].toSet(),
        onWebResourceError: (error) {
          widget.finishedCallback(2);
        },
      ),
      onWillPop: () async {
        return _goBack(context);
      },
    );
  }
}

class BaseWebview extends StatefulWidget {
  BaseWebview({
    Key key,
    this.initialUrl,
    this.prefetchData,
    this.finishedCallback,
  }) : super(key: key);

  final String initialUrl;
  final dynamic prefetchData;
  final int startTime = DateTime.now().millisecondsSinceEpoch;
  final finishedCallback;

  @override
  BaseWebviewState createState() => BaseWebviewState();
}
