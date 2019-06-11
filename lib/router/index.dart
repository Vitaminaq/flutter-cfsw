import 'package:flutter/widgets.dart';
import './routes.dart' as Routes;

class Router {
  push<P>(BuildContext context, String name, {Map<String, P> params}) {
    return Navigator.of(context).pushNamed(name, arguments: params);
  }
  // replace<T>(BuildContext context) {
  //   Navigator.of(context).replace<T>(oldRoute: oldRoute, newRoute: newRoute);
  // }
}

final Router router = Router();
final Map<String, WidgetBuilder> routers = Routes.routes;
