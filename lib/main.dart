import 'package:flutter/material.dart';
import './views/home.dart';
import 'package:flutterdemo/router/index.dart';
import 'package:flutterdemo/views/home.dart';
import 'package:flutterdemo/views/artic-detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
      // initialRoute: '/',
      routes: <String, WidgetBuilder>{
        // '/': (BuildContext context) => Home(),
        '/artic': (BuildContext context) => ArticDetail()
      },
    );
  }
}
