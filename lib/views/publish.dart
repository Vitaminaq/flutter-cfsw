import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/test.dart';

class Publish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter1>(
      builder: (context, counter1, child) => Column(
        children: <Widget>[
          Text('${counter1.value}'),
          FlatButton(
            child: Text('增加'),
            onPressed: () {
              counter1.increment();
            },
          ),
          Center(
              child: Text(
            '暂不开放，敬请期待，期待喜欢开发的你加入',
            style: TextStyle(
              fontSize: 18,
            ),
          ))
        ],
      ),
    );
  }
}
