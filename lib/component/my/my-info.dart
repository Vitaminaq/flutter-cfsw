import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../button/button-max.dart';
import './my-info-top.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          MyInfoTop(),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(children: [
              Image.asset(
                'lib/images/download.png',
                height: 60,
                width: 76,
              ),
              Expanded(child: Text('')),
              Container(
                  padding: EdgeInsets.only(right: 60.0),
                  child: Column(
                    children: [
                      Text(
                        '更多优质阅读学习体验',
                        style: TextStyle(
                            color: Color(0xFF606266),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 6.0, bottom: 8.0),
                        height: 40.0,
                        width: 160.0,
                        child: ButtonMax(
                          btnText: '请下载小獴阅读App',
                          radius: 20.0,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        '或微信搜索小獴阅读',
                        style: TextStyle(
                          color: Color(0xFF606266),
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ))
            ]),
          )
        ],
      ),
    );
  }
}
