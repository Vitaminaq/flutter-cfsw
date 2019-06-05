import 'package:flutter/material.dart';
import '../views/publish.dart';
import '../views/artic-detail.dart';

class Router {
  // 去发表
  void toPublish(context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Publish();
        },
      ),
    );
  }

  void toArticDetail(context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return ArticDetail();
        },
      ),
    );
  }
}
