import 'package:flutter/material.dart';
import 'package:flutterdemo/views/home.dart';
import 'package:flutterdemo/views/webview.dart';
import 'package:flutterdemo/views/login.dart';

// =============> 路由管理 <===============

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => Home(),
  '/artic/detail': (
    BuildContext context,
  ) =>
      ArticDetail(),
  '/integral/centre': (
    BuildContext context,
  ) =>
      MyPoint(),
  '/integral/detail': (
    BuildContext context,
  ) =>
      MyPointRule(),
  '/login': (
    BuildContext context,
  ) =>
      Login()
};
