import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/test.dart';

class PublishState extends State<Publish> {
  @override
  initState() {
    super.initState();
  }

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
              // Provider.of<Counter1>(context, listen: false).increment();
            },
          )
        ],
      ),
    );
  }
}

class Publish extends StatefulWidget {
  @override
  PublishState createState() => PublishState();
}
