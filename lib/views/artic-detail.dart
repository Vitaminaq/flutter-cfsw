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
        initialUrl: '$baseH5/blog/detail?v=1.0.0#id=$id',
        prefetchData: params['item']);
  }
}
