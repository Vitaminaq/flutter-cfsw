import 'package:flutter/material.dart';
import 'package:flutterdemo/views/home.dart';
import 'package:flutterdemo/views/artic-detail.dart';

// =============> 路由管理 <===============

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => Home(),
  'artic': (BuildContext context) => ArticDetail()
};
