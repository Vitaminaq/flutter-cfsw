import 'package:flutter/widgets.dart';
import './custom-router.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/views/webview.dart';
import 'package:flutterdemo/views/login.dart';
import 'package:flutterdemo/views/video.dart';

class Router {
  push(BuildContext context, Widget to) {
    return Navigator.of(context).push(CustomRoute(to));
  }

  back<T>(BuildContext context, [T result]) {
    return Navigator.pop(context, result);
  }
  // replace<T>(BuildContext context) {
  //   Navigator.of(context).replace<T>(oldRoute: oldRoute, newRoute: newRoute);
  // }
}

final router = Router();

class RouterList {
  // 文章详情页
  articDetail(BuildContext context, {dynamic params}) {
    return router.push(context, ArticDetail(params));
  }

  // 学点中心
  integralCentre(BuildContext context, {dynamic params}) {
    return router.push(context, MyPoint());
  }

  // 学点详情
  integralDetail(BuildContext context, {dynamic params}) {
    return router.push(context, MyPointRule());
  }

  // 阅读闯关
  chuangGuan(BuildContext context, {dynamic params}) {
    return router.push(context, ChuangGuan(params));
  }

  // 纯净版webview
  pureWebview(BuildContext context, {dynamic params}) {
    return router.push(context, PureWebview(params));
  }

  // 登录
  login(
    BuildContext context,
  ) {
    return router.push(context, Login());
  }

  // 播放视频
  videoPlay(BuildContext context, {dynamic params}) {
    return router.push(context, LocalVideoPlayerPage(params));
  }
}

final $router = RouterList();
