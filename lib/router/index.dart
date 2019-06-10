import 'package:flutter/widgets.dart';

import './routes.dart';
import 'package:flutterdemo/views/artic-detail.dart';

final Router router = Router();
final Map<String, WidgetBuilder> routes = {
  'artic-detail': (BuildContext context) => ArticDetail()
};
