import 'package:flutter/material.dart';

class OperateItem extends StatelessWidget {
  final String icon;
  final int count;
  final Function callback;

  OperateItem({Key key, @required this.icon, this.count, this.callback})
      : assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext content) {
    return FlatButton(
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            icon,
            height: 20.0,
            width: 20.0,
          ),
          count == null
              ? Padding(padding: EdgeInsets.all(0.0))
              : Text(count.toString(),
                  style: TextStyle(fontSize: 12, color: Color(0xFF303133))),
        ],
      ),
      onPressed: () async {
        if (callback == null) return;
        callback();
      },
    );
  }
}
