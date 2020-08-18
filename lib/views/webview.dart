import 'package:flutter/material.dart';
import 'package:flutterdemo/component/webview/base-webview-page.dart';
import '../config.dart';

// 文章详情
class ArticDetail extends StatelessWidget {
  final dynamic params;

  ArticDetail(this.params);

  @override
  Widget build(BuildContext content) {
    // final dynamic params = ModalRoute.of(content).settings.arguments;
    final int id = params['item'] == null ? 1 : params['item'].id;
    return BaseWebviewPage(
        initialUrl: '$baseH5/blog/detail?v=1.0.4#id=$id',
        prefetchData: params['item']);
  }
}

// 学点中心
class MyPoint extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return BaseWebviewPage(
        statusBarColor: 0xff07C89A,
        initialUrl: '$baseH5/integral/centre?v=1.0.4&h5Title=true');
  }
}

// 学点规则
class MyPointRule extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return BaseWebviewPage(
        statusBarColor: 0xff07C89A,
        initialUrl:
            '$baseH5/integral/detail?v=1.0.4&tabType=rule&h5Title=true');
  }
}

// 答题闯关
class ChuangGuan extends StatelessWidget {
  final dynamic params;

  ChuangGuan(this.params);

  @override
  Widget build(BuildContext content) {
    final int bookId =
        params == null || params['bookid'] == null ? 0 : params['bookid'];
    final String token =
        params == null || params['token'] == null ? '' : params['token'];
    return BaseWebviewPage(
        pure: true,
        hasAppBar: true,
        initialUrl:
            '$baseUrl/game/chuangguan/index.html?bookid=$bookId&token=$token&gender=1&from=wx-min&env=test&platform=APP_DEVTOOLS&random=${DateTime.now().millisecondsSinceEpoch}');
  }
}

// 空webview，用于打开外链
class PureWebview extends StatelessWidget {
  final dynamic params;

  PureWebview(this.params);

  @override
  Widget build(BuildContext content) {
    final String url =
        params == null || params['url'] == null ? '' : params['url'];
    return BaseWebviewPage(
        statusBarColor: 0xffffffff,
        beforeBarColor: 0xff07C89A,
        pure: true,
        hasAppBar: true,
        initialUrl: url);
  }
}
