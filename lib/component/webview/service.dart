import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutterdemo/router/index.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:photo_view/photo_view.dart';

import './keyboard-popup.dart';
import '../../router/index.dart';

class ResponseActionOptions {
  String jsonStr;
  BuildContext context;
  WebViewController controller;
  String url;

  ResponseActionOptions(
      {@required this.jsonStr,
      @required this.context,
      @required this.controller,
      this.url})
      : assert(jsonStr != null),
        assert(context != null),
        assert(controller != null);
}

class JsonStr {
  int code;
  String resolveName;
  String rejectName;
  String fnName;
  dynamic params;

  JsonStr(
      {this.code, this.resolveName, this.rejectName, this.fnName, this.params});

  factory JsonStr.fromJson(Map json) => JsonStr(
      code: json["code"] == null ? null : json["code"],
      resolveName: json["resolveName"] == null ? null : json["resolveName"],
      rejectName: json["rejectName"] == null ? null : json["rejectName"],
      fnName: json["fnName"] == null ? null : json["fnName"],
      params: json["params"] == null ? null : json["params"]);
}

class H5Response {
  int code;
  dynamic data;

  H5Response({this.code = 0, this.data});

  Map toJson() {
    Map map = Map();
    map["code"] = code;
    map["data"] = data;
    return map;
  }
}

final Function responseAction = (ResponseActionOptions options) {
  final JsonStr reslut =
      JsonStr.fromJson(json.decode(options.jsonStr.toString()));
  switch (reslut.code) {
    case 10000:
      router.back(options.context);
      break;
    case 10001:
      router.push(options.context, '/login');
      break;
    case 10002:
      Share.share('【不仅仅是测试分享】\n ${options.url}');
      break;
    case 10003:
      showDialog<Null>(
          context: options.context, //BuildContext对象
          //点击外部可以消失
          barrierDismissible: true,
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); //退出弹出框
              },
              child: LoadingDialog(
                //调用对话框
                text: '正在加载...',
              ),
            );
          });
      break;
    case 10004:
      showDialog<Null>(
          context: options.context, //BuildContext对象
          //点击外部可以消失
          barrierDismissible: true,
          builder: (BuildContext context) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(); //退出弹出框
                },
                child: PhotoView(
                  imageProvider: NetworkImage(reslut.params[0]),
                ));
          });
      break;
    default:
      break;
  }
  // // 释放promise
  // options.controller
  //     .evaluateJavascript("__app_native_callback__['${reslut.resolveName}']()");
};

class PreviewImageParams {}
