import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/api/publics.dart';

import '../utils/storage.dart';
import '../model/publics.dart';

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
    await Storage.setStringItem(tokenKey, key);
    token = key;
    notifyListeners();
    return;
  }

  ///
  /// 用户信息
  ///
  dynamic userInfo;

  Future<UserInfoResponse> getUserInfo() async {
    final UserInfoResponse r = await api.getUserInfo();
    if (r.code != 1) return r;
    userInfo = r.data;
    return r;
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
    currentWebview = wv;
  }

  static setInitialUrl(String url) {
    initialUrl = url;
  }
}
