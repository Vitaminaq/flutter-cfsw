import 'package:flutter/material.dart';
import 'package:flutterdemo/views/home.dart';
import 'package:flutterdemo/views/artic-detail.dart';
import 'package:flutterdemo/views/login.dart';

// =============> 路由管理 <===============

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => Home(),
  '/artic/detail': (
    BuildContext context,
  ) =>
      ArticDetail(),
  '/login': (
    BuildContext context,
  ) =>
      Login()
};
