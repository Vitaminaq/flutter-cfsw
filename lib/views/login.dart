import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/component/login/login-form.dart';
import 'package:flutterdemo/component/login/login-bar.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      LoginBar(),
      Container(
          child: Image.asset(
        'lib/images/login.png',
        height: 110.0,
        width: 110.0,
      )),
      LoginForm()
    ])));
  }
}
