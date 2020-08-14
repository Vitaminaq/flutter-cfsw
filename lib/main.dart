import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutterdemo/router/index.dart';
import 'package:flutterdemo/utils/publics.dart';
import './store/index.dart';

void main() {
  runApp(MultiProvider(providers: providerList, child: MyApp()));
  setStatusBarColor(0xffffffff);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      routes: routers,
    );
  }
}
