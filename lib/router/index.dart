import 'package:flutter/widgets.dart';
import './routes.dart' as Routes;

import 'package:flutterdemo/views/artic-detail.dart';

SlideTransition createTransition(Animation<double> animation, Widget child) {
  return new SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(animation),
    child: child,
  );
}

class Router {
  push(BuildContext context, String name, {dynamic params}) {
    return Navigator.of(context).pushNamed(name, arguments: params);
  }

  back<T>(BuildContext context, [T result]) {
    return Navigator.pop(context, result);
  }

  pushAnimate(BuildContext context, String name, {dynamic params}) {
    Navigator.push<String>(
        context,
        PageRouteBuilder(pageBuilder: (BuildContext context,
            Animation<double> animation, Animation<double> secondaryAnimation) {
          // 跳转的路由对象
          return ArticDetail();
        }, transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return createTransition(animation, child);
        }));
  }
  // replace<T>(BuildContext context) {
  //   Navigator.of(context).replace<T>(oldRoute: oldRoute, newRoute: newRoute);
  // }
}

final router = Router();
final Map<String, WidgetBuilder> routers = Routes.routes;
