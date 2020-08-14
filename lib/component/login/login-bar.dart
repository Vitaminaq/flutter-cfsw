import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/router/index.dart';

class LoginBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 6.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
            height: 40.0,
            width: 40.0,
            alignment: Alignment.center,
            child: Image.asset(
              'lib/images/close.png',
              height: 20.0,
              width: 20.0,
            )),
        onTap: () {
          router.back(context);
        },
      ),
    );
  }
}
