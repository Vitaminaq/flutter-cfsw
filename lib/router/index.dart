import 'package:flutter/widgets.dart';
import './routes.dart' as Routes;

class Router {
  push(BuildContext context, String name, {dynamic params}) {
    return Navigator.of(context).pushNamed(name, arguments: params);
  }

  back<T>(BuildContext context, [T result]) {
    return Navigator.pop(context, result);
  }
  // replace<T>(BuildContext context) {
  //   Navigator.of(context).replace<T>(oldRoute: oldRoute, newRoute: newRoute);
  // }
}

final router = Router();
final Map<String, WidgetBuilder> routers = Routes.routes;
