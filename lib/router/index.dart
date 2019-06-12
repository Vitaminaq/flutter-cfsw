import 'package:flutter/widgets.dart';
import './routes.dart' as Routes;

class Router {
  push(BuildContext context, String name, {Map<String, dynamic> params}) {
    Navigator.of(context).pushNamed(name, arguments: params);
  }

  back(BuildContext context) {
    Navigator.pop(context);
  }
  // replace<T>(BuildContext context) {
  //   Navigator.of(context).replace<T>(oldRoute: oldRoute, newRoute: newRoute);
  // }
}

final router = Router();
final Map<String, WidgetBuilder> routers = Routes.routes;
