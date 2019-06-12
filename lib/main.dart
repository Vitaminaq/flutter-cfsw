import 'package:flutter/material.dart';
import './views/home.dart';
import 'package:flutterdemo/router/index.dart';
import 'package:flutterdemo/views/home.dart';
import 'package:flutterdemo/views/artic-detail.dart';
import 'package:flutterdemo/views/chatroom.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      // initialRoute: '/',
      // onGenerateRoute: (settings) {
      //   final builder = (BuildContext context) => ArticDetail();
      //   return MaterialPageRoute(builder: builder, settings: settings);
      // },
      // home: Home(),
      routes: routers,
    );
  }
}
