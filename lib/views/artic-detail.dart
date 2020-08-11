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
        initialUrl:
            '$baseH5/blog/detail?id=$id&token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC90ZXN0LmJsdWV1cC5jblwvYXBpXC9sb2dpbiIsImlhdCI6MTU5NzA0NTA2MiwiZXhwIjoxNTk3NjQ5ODYyLCJuYmYiOjE1OTcwNDUwNjIsImp0aSI6IlpIY1htc05XTm9qVmthNUciLCJzdWIiOjEsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEiLCJpbXBlcnNvbmF0ZWRfYnkiOm51bGx9.dmSNsSFzJv6jYyrmCuBEZsaUmnebsrQGpeiwA8be158',
        prefetchData: params['item']);
  }
}
