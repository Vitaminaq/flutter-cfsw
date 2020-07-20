import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

import '../utils/storage.dart';

class PublicsStore with ChangeNotifier {
  String token = '';

  bool get isLogin => token == '' ? false : true;

  dynamic getToken() async {
    final String r = await Storage.getStringItem(tokenKey);
    token = r;
    notifyListeners();
  }

  static dynamic getCurrentToken() async {
    final String r = await Storage.getStringItem(tokenKey);
    return r;
  }

  dynamic setToken(String key) async {
    Storage.setStringItem(tokenKey, key);
    token = key;
    notifyListeners();
  }
}

// webview缓存
class WebviewStore {
  static WebViewController controller;

  static Widget currentWebview;

  static String initialUrl;

  static setWebViewController(WebViewController ctl) {
    controller = ctl;
  }

  static setWebView(Widget wv) {
    print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
    currentWebview = wv;
  }

  static setInitialUrl(String url) {
    initialUrl = url;
  }
}
