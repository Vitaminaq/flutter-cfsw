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
    return GestureDetector(
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            icon,
            height: 23.0,
            width: 23.0,
          ),
          count == null
              ? Padding(padding: EdgeInsets.all(0.0))
              : Text(count.toString(),
                  style: TextStyle(fontSize: 13, color: Color(0xFF303133))),
        ],
      ),
      onTap: () async {
        if (callback == null) return;
        callback();
      },
    );
  }
}
