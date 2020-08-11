import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ButtonMax extends StatelessWidget {
  final String btnText;
  final Function callback;
  final bool disable;

  ButtonMax({Key key, this.btnText, this.callback, this.disable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        padding: EdgeInsets.all(10.0),
        child: Text(btnText, style: TextStyle(fontSize: 18.0)),
        color: disable ? Color(0xffbcbcbc) : Color(0xff00c295),
        textColor: Colors.white,
        onPressed: () {
          callback();
        });
  }
}
