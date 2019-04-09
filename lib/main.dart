import 'package:flutter/material.dart';
import './views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
      initialRoute: '/',
      // routes: {
      //   '/': (BuildContext context) => (),
      //   '/signup': (BuildContext context) => SignUpPage(),
      // },
    );
  }
}
