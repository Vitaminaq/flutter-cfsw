import 'package:flutter/material.dart';

class ReadBookLabel extends StatelessWidget {
  final String label;
  ReadBookLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, right: 10.0, bottom: 15.0),
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
      decoration: BoxDecoration(
          color: Color(0xffebf9ff),
          borderRadius: BorderRadius.all(Radius.circular(17.0))),
      child: Text(
        label,
        style: TextStyle(color: Color(0xff00c295), fontSize: 12.0),
      ),
    );
  }
}
