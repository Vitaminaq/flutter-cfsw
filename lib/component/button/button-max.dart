import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ButtonMax extends StatelessWidget {
  final String btnText;
  final Function callback;
  final bool disable;
  final double radius;
  final double fontSize;

  ButtonMax(
      {Key key,
      this.btnText,
      this.callback,
      this.disable = false,
      this.radius = 0.0,
      this.fontSize = 18.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(btnText, style: TextStyle(fontSize: fontSize)),
        color: disable ? Color(0xffbcbcbc) : Color(0xff00c295),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        onPressed: () {
          callback();
        });
  }
}

class ButtonLogin extends StatelessWidget {
  final String btnText;
  final Function callback;
  final bool disable;
  final double radius;
  final double fontSize;

  ButtonLogin(
      {Key key,
      this.btnText,
      this.callback,
      this.disable = false,
      this.radius = 0.0,
      this.fontSize = 18.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 44.0,
        child: ButtonMax(
            btnText: btnText,
            disable: disable,
            callback: callback,
            fontSize: fontSize));
  }
}
