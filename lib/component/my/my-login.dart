import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/router/index.dart';
import '../button/button-max.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Text('登录后体验更多功能', style: TextStyle(fontSize: 26.0)),
          Expanded(
              child: Center(
                  child: Image.asset(
            'lib/images/welcome.png',
            height: 200.0,
            width: 240.0,
          ))),
          Container(
              padding: EdgeInsets.only(bottom: 32.0),
              child: Row(children: [
                Expanded(
                    child: ButtonMax(
                  btnText: '登录 | 注册',
                  callback: () {
                    router.push(context, '/login');
                  },
                )),
              ]))
        ],
      ),
    );
  }
}
