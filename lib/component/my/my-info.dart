import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../button/button-max.dart';
import './my-info-top.dart';
import './my-menu-item.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          MyInfoTop(),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(children: [
              Padding(padding: EdgeInsets.only(left: 16.0)),
              Image.asset(
                'lib/images/download.png',
                height: 64,
                width: 79,
              ),
              Expanded(child: Text('')),
              Container(
                  padding: EdgeInsets.only(right: 40.0, bottom: 10.0),
                  child: Column(
                    children: [
                      Text(
                        '更多优质阅读学习体验',
                        style: TextStyle(
                            color: Color(0xFF606266),
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 6.0, bottom: 8.0),
                        height: 46.0,
                        width: 180.0,
                        child: ButtonMax(
                          btnText: '请下载小獴阅读App',
                          radius: 20.0,
                          fontSize: 13.0,
                          callback: () async {
                            final String apkUrl =
                                'http://fir.blueup.cn/MyAndroid';
                            if (await canLaunch(apkUrl)) {
                              await launch(apkUrl);
                            } else {
                              throw 'Could not launch $apkUrl';
                            }
                          },
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
          ),
          Container(
            height: 38.0,
            padding: EdgeInsets.only(left: 16.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Color(0xfff0f0f0)),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '下载福利',
                  style: TextStyle(color: Color(0xff606266), fontSize: 13.0),
                )),
          ),
          MyMenuItem(
              icon: 'lib/images/point.png',
              title: '我的学点',
              extralText: '100',
              toPath: '/integral/centre'),
          MyMenuItem(
            icon: 'lib/images/point-rule.png',
            title: '学点规则',
            toPath: '/integral/detail',
          ),
        ],
      ),
    );
  }
}
