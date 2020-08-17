import 'package:dio/dio.dart';
import 'dart:math';
import './storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/api/index.dart';
import 'package:flutterdemo/api/publics.dart' as publics;
import 'package:flutterdemo/model/publics.dart' as publicsModal;

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

// 单个上传七牛云
Future<dynamic> Function(String, publicsModal.QiNiuTokenResponse)
    uploadQiNiuFile =
    (String path, publicsModal.QiNiuTokenResponse tokenR) async {
  final String token = tokenR.data.token;
  final String basePath = tokenR.data.basePath;
  String name = Random().nextInt(10000).toString() +
      DateTime.now().millisecondsSinceEpoch.toString() +
      path.substring(path.lastIndexOf("."));
  FormData formData = FormData.fromMap({
    "file": await MultipartFile.fromFile(path, filename: name),
    'token': token,
    'key': '$basePath$name'
  });
  return uploadAxios.post('', formData);
};

// 并发上传七牛云
Future<List<dynamic>> Function(List<String>, publicsModal.QiNiuTokenResponse)
    uploadQiNiuFiles =
    (List<String> paths, publicsModal.QiNiuTokenResponse tokenR) async {
  return uploadAxios
      .all(paths.map((e) async => uploadQiNiuFile(e, tokenR)).toList());
};

Future<List<dynamic>> Function(List<String>) uploadQiNiu =
    (List<String> paths) async {
  // 获取上传七牛云token
  final publicsModal.QiNiuTokenResponse tokenR =
      await publics.api.getQiNiuToken();
  if (tokenR.code != 1) return [];
  final List<dynamic> response = await uploadQiNiuFiles(paths, tokenR);
  if (response == null) return [];
  // 构造成可储存的数据结构
  return formatSource(tokenR.data.domain, response);
};

List<dynamic> Function(String, List<dynamic>) formatSource =
    (String domain, List<dynamic> sources) {
  return sources
      .map((e) => {
            'type': 'image',
            'attached': false,
            'url': domain + e['key'],
            'path': '',
            'size': '',
            'duration': 0,
            'content': '',
            'home_id': 0,
            'overall': 0
          })
      .toList();
};
