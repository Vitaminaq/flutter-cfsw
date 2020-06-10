import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ButtonMax extends StatelessWidget {
  final String btnText;
  final Function callback;

  ButtonMax({Key key, this.btnText, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        padding: EdgeInsets.all(10.0),
        child: Text(btnText, style: TextStyle(fontSize: 18.0)),
        color: Color(0xFF00dcFF),
        textColor: Colors.white,
        onPressed: () {
          callback();
        });
  }
}
