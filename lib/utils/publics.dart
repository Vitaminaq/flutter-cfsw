import './storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

final Function getToken = () async {
  final String token = await Storage.getStringItem('TOKEN');
  return token == null ? '' : token;
};

final Function isLogin = () async {
  final r = await Storage.getStringItem('TOKEN');
  return r == null ? false : true;
};

// 设置状态栏颜色
void Function([int]) setStatusBarColor = ([int color]) {
  SystemUiOverlayStyle systemUiOverlayStyle;
  if (color == null) {
    systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  } else {
    systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Color(color));
  }
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
};
