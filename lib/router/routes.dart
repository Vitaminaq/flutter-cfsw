import 'package:flutter/material.dart';
import '../views/publish.dart';
import '../views/artic-detail.dart';

class Router {
  // 去发表
  void toPublish(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Publish();
        },
      ),
    );
  }

  void toArticDetail(BuildContext context, params) {
    // Navigator.of(context).push(
    //   MaterialPageRoute<void>(
    //     builder: (BuildContext context) {
    //       return ArticDetail();
    //     },
    //   ),
    // );
    Navigator.of(context).pushNamed('/artic/detail', arguments: params);
  }
}
