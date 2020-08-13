import 'package:flutter/material.dart';
import '../component/webview/base-webview-page.dart';
import '../config.dart';

// 文章详情
class ArticDetail extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    final dynamic params = ModalRoute.of(content).settings.arguments;
    final int id = params['item'] == null ? 1 : params['item'].id;
    return BaseWebviewPage(
        initialUrl: '$baseH5/blog/detail?v=1.0.2#id=$id',
        prefetchData: params['item']);
  }
}

// 学点中心
class MyPoint extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return BaseWebviewPage(
        initialUrl: '$baseH5/integral/centre?v=1.0.2&h5Title=true');
  }
}

// 学点规则
class MyPointRule extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return BaseWebviewPage(
        initialUrl:
            '$baseH5/integral/detail?v=1.0.2&tabType=rule&h5Title=true');
  }
}

// 答题闯关
class ChuangGuan extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    final dynamic params = ModalRoute.of(content).settings.arguments;
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
