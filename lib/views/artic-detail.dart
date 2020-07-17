import 'package:flutter/material.dart';

import '../component/webview/base-webview-page.dart';
import '../config.dart';

// 文章详情
class ArticDetailState extends State<ArticDetail> {
  @override
  Widget build(BuildContext content) {
    final dynamic params = ModalRoute.of(context).settings.arguments;
    final int id = params['item'] == null ? 1 : params['item'].articId;
    return BaseWebviewPage(
        initialUrl: '$baseUrl:8000/blog/detail?v=1.0.0#id=$id',
        // 'https://test.blueup.cn/hybird/report/single-book?v=1.0.0#book_id=21&class_id=127&tabType=complete&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC90ZXN0LmJsdWV1cC5jblwvYXBpXC9sb2dpbiIsImlhdCI6MTU5NDEwNzI3MSwiZXhwIjoxNTk0NzEyMDcxLCJuYmYiOjE1OTQxMDcyNzEsImp0aSI6InZ1YlhQYUdSMWt6VkpOSEIiLCJzdWIiOjEsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEiLCJpbXBlcnNvbmF0ZWRfYnkiOm51bGx9.DODxABI08RgBxHPEgSgJFu668zcaC7tYzKclSq8P9uI',
        prefetchData: params['item']);
  }
}

class ArticDetail extends StatefulWidget {
  @override
  ArticDetailState createState() => ArticDetailState();
}
