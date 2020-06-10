import 'dart:convert';
import 'package:flutterdemo/router/index.dart';
import 'package:flutter/material.dart';

class JsonStr {
  int code;
  String resolveName;
  String rejectName;
  String fnName;

  JsonStr({this.code, this.resolveName, this.rejectName, this.fnName});

  factory JsonStr.fromJson(Map json) => JsonStr(
      code: json["code"] == null ? null : json["code"],
      resolveName: json["resolveName"] == null ? null : json["resolveName"],
      rejectName: json["rejectName"] == null ? null : json["rejectName"],
      fnName: json["fnName"] == null ? null : json["fnName"]);
}

final Function responseAction = (String jsonStr, BuildContext context) {
  final JsonStr reslut = JsonStr.fromJson(json.decode(jsonStr.toString()));
  switch (reslut.code) {
    case 10000:
      print('路由后退');
      router.back(context);
      break;
  }
};
