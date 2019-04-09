import 'package:flutter/material.dart';
import '../views/publish.dart';
class Router {
  static void toPublisht(context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Publish();
        },
      ),
    );
  }
}