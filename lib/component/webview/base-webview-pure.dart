import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'service.dart';

///
/// 纯净版webview
///
class BaseWebviewPure extends StatelessWidget {
  BaseWebviewPure({
    Key key,
    this.initialUrl,
    this.finishedCallback,
  })  : assert(initialUrl != null),
        super(key: key);

  final String initialUrl;
  final finishedCallback;

  @override
  Widget build(BuildContext content) {
    WebViewController controller;
    return WillPopScope(
      child: Container(
          height: MediaQuery.of(content).size.height,
          child: WebView(
            key: Key(initialUrl),
            initialUrl: initialUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              controller = webViewController;
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) async {
              finishedCallback(1);
            },
            gestureNavigationEnabled: true,
            debuggingEnabled: false,
            onWebResourceError: (error) {
              // finishedCallback(2);
            },
          )),
      onWillPop: () async {
        return goBack(content, controller);
      },
    );
  }
}
