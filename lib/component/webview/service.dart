import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutterdemo/router/index.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import './keyboard-popup.dart';

import '../../router/index.dart';
import '../../utils/publics.dart';
import '../../store/chatroom.dart';

class ResponseActionOptions<S> {
  String jsonStr;
  BuildContext context;
  WebViewController controller;
  String url;
  dynamic prefetchData;
  S storeModule;
  dynamic fatherContext;

  ResponseActionOptions(
      {@required this.jsonStr,
      @required this.context,
      @required this.controller,
      this.url,
      this.prefetchData,
      this.storeModule,
      this.fatherContext})
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

final Function responseAction = (ResponseActionOptions options) async {
  final JsonStr reslut =
      JsonStr.fromJson(json.decode(options.jsonStr.toString()));
  bool autoCallback = true;
  switch (reslut.code) {
    // 路由后退
    case 10000:
      router.back(options.context);
      break;
    // 跳转登录，同步状态
    case 10001:
      autoCallback = false;
      final r = await router.push(options.context, '/login');
      if (r != null) {
        final String token = await getToken();
        // 向h5同步登陆态信息
        final dynamic params = "{'code': 10001, 'token': '$token'}";
        options.controller
            .evaluateJavascript("app.getSyncAppState($params)")
            .then((result) {
          print('h5接受到的信息 $params');
        });
      }
      break;
    // 分享详情页
    case 10002:
      Share.share('【不仅仅是测试分享】\n ${options.url}');
      break;
    // 评论
    case 10003:
      autoCallback = false;
      showDialog<Null>(
          context: options.context, //BuildContext对象
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                router.back(context); //退出弹出框
              },
              child: CommentDialog(
                callback: (value) {
                  // 释放promise
                  final dynamic r = {'code': 0, 'data': '$value'};
                  options.controller.evaluateJavascript(
                      "__app_native_callback__['${reslut.resolveName}']&&__app_native_callback__['${reslut.resolveName}'](${json.encode(r)})");
                  router.back(context);
                },
              ),
            );
          });
      break;
    // 预览图片
    case 10004:
      showDialog<Null>(
          context: options.context, //BuildContext对象
          builder: (BuildContext context) {
            return GestureDetector(
                onTap: () {
                  router.back(context); //退出弹出框
                },
                child: PhotoView(
                  imageProvider: NetworkImage(reslut.params[0]),
                ));
          });
      break;
    // 预请求数据
    case 10005:
      autoCallback = false;
      final dynamic r = {'code': 0, 'data': options.prefetchData};
      options.controller.evaluateJavascript(
          "__app_native_callback__['${reslut.resolveName}'](${json.encode(r)})");
      break;
    // 更新点赞状态
    case 10006:
      // 不更新当前视图
      Provider.of<ChatRoomStore>(options.context, listen: false)
          .updateClickStatus(reslut.params['id']);
      break;
    default:
      break;
  }
  if (autoCallback == false) return;
  // 释放promise
  final dynamic r = {'code': 0};
  options.controller.evaluateJavascript(
      "__app_native_callback__['${reslut.resolveName}']&&__app_native_callback__['${reslut.resolveName}'](${json.encode(r)})");
};

// 向h5同步token等信息标准数据结构
final Function setStateToH5 = (int code) async {
  final String token = await getToken();
  return json.encode({'code': code, 'token': token});
};
