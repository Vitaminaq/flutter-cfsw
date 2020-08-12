import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/router/index.dart';

class MyMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final String extralText;
  final String toPath;

  MyMenuItem(
      {Key key,
      @required this.icon,
      this.title = '',
      this.extralText = '',
      this.toPath})
      : assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: GestureDetector(
        child: Container(
          padding: EdgeInsets.only(top: 14.0, bottom: 14.0),
          child: Row(children: [
            Image.asset(
              icon,
              height: 22.0,
              width: 22.0,
            ),
            Padding(padding: EdgeInsets.only(left: 8.0)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(color: Color(0xff303133), fontSize: 16.0),
              ),
            ),
            Expanded(child: Text('')),
            Text(
              extralText,
              style: TextStyle(color: Color(0xffcdcdcd), fontSize: 12.0),
            ),
            Padding(padding: EdgeInsets.only(left: 4.0)),
            Image.asset(
              'lib/images/to.png',
              height: 14.0,
              width: 14.0,
            ),
          ]),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: Color(0xFFF0F0F0)),
            ),
          ),
        ),
        onTap: () {
          if (toPath == null) return;
          router.push(context, toPath);
        },
      ),
    );
  }
}
