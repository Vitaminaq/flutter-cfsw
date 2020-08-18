import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutterdemo/router/index.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutterdemo/utils/filter.dart';
import 'package:flutterdemo/component/popup/toast.dart';

import 'package:flutterdemo/utils/publics.dart';
import 'package:flutterdemo/component/tools/image-view.dart';
import 'package:flutterdemo/component/tools/comment.dart';

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
  String code;
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
  String code;
  dynamic data;

  H5Response({this.code = '0', this.data});

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
  // h5传递过来的参数
  final dynamic h5Params = reslut.params;
  final BuildContext wbContext = options.context;
  bool autoCallback = true;
  switch (reslut.code) {
    // case '10000':
    //   break;
    // case '10001':
    //   break;
    // case '10002':
    //   break;
    // 关闭webview
    case '10003':
      setStatusBarColor(0xffffffff);
      router.back(wbContext);
      break;
    // 跳转登录，同步状态
    case '10004':
      autoCallback = false;
      final r = await $router.login(wbContext);
      if (r != null) {
        final String token = await getToken();
        // 向h5同步登陆态信息
        final dynamic params = "{'code': 10001, 'token': '$token'}";
        options.controller
            .evaluateJavascript("$h5App.getSyncAppState($params)")
            .then((result) {
          print('h5接受到的信息 $params');
        });
      }
      break;
    // // 去个人主页-普通
    // case '10005':
    //   break;
    // // 去个人主页-名家
    // case '10006':
    //   break;
    // 图片预览
    case '10007':
      showDialog<Null>(
          context: wbContext, //BuildContext对象
          builder: (BuildContext context) {
            return GestureDetector(
                onTap: () {
                  router.back(context); //退出弹出框
                },
                child:
                    ImageView(h5Params['imgList'], h5Params['currentIndex']));
          });
      break;
    // 分享微博
    case '10008':
      Share.share('【不仅仅是测试分享】\n ${options.url}');
      break;
    // 评论或者回复
    case '10009':
      autoCallback = false;
      comment(wbContext, h5Params, () {
        h5DefalutCallback(options, reslut);
      });
      break;
    // 视频播放
    case '10010':
      $router.videoPlay(wbContext, params: {'url': h5Params['src']});
      break;
    // 预取可用数据
    case '10011':
      autoCallback = false;
      final dynamic r = {'code': 1, 'data': options.prefetchData};
      options.controller.evaluateJavascript(
          "$h5Callback && $h5Callback['${reslut.resolveName}'](${json.encode(r)})");
      break;
    case '10013':
      setStatusBarColor(h5Params);
      break;
    case '10014':
      $router.pureWebview(wbContext, params: {'url': h5Params});
      break;
    default:
      toast(options.context, '体验更多功能，请下载小獴阅读app');
      break;
  }
  if (autoCallback == false) return;
  // 释放promise
  h5DefalutCallback(options, reslut);
};

final Function h5DefalutCallback = (options, reslut) {
  // 释放promise
  final dynamic r = {'code': 1};
  options.controller.evaluateJavascript(
      "$h5Callback['${reslut.resolveName}']&&$h5Callback['${reslut.resolveName}'](${json.encode(r)})");
};

// 向h5同步token等信息标准数据结构
final Function setStateToH5 = (int code) async {
  final String token = await getToken();
  return json.encode({'code': code, 'token': token});
};

Future<bool> Function(BuildContext, WebViewController) goBack =
    (BuildContext context, WebViewController controller) async {
  if (controller != null && await controller.canGoBack()) {
    controller.goBack();
    return false;
  }
  setStatusBarColor(0xffffffff);
  return true;
};
