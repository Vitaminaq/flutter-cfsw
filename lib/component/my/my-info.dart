import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../button/button-max.dart';
import '../../store/publics.dart';
import 'package:provider/provider.dart';
import 'package:flutterdemo/router/index.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15.0),
              ),
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1638079650,2146947483&fm=27&gp=0.jpg',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      '只愿梦不醒，满城柳絮纷飞',
                      style:
                          TextStyle(color: Color(0xFF333333), fontSize: 16.0),
                    ),
                  ),
                  Container(
                    width: 270,
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                              child: Column(
                            children: <Widget>[
                              Text(
                                '2',
                                style: TextStyle(
                                    color: Color(0xFF333333), fontSize: 16.0),
                              ),
                              Text(
                                '关注',
                                style: TextStyle(
                                    color: Color(0xFF666666), fontSize: 12.0),
                              )
                            ],
                          )),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                '0',
                                style: TextStyle(
                                    color: Color(0xFF333333), fontSize: 16.0),
                              ),
                              Text(
                                '粉丝',
                                style: TextStyle(
                                    color: Color(0xFF666666), fontSize: 12.0),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                '2',
                                style: TextStyle(
                                    color: Color(0xFF333333), fontSize: 16.0),
                              ),
                              Text(
                                '获赞与收藏',
                                style: TextStyle(
                                    color: Color(0xFF666666), fontSize: 12.0),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
            width: 500,
            child: Text('天地不仁，以万物为刍狗!'),
          ),
          Container(
            height: 0.2,
            color: Color(0xFFA9A9A9),
          ),
          DefaultTabController(
            length: 2,
            child: Container(
              padding: EdgeInsets.only(left: 110.0, right: 110.0),
              child: TabBar(
                  tabs: <Widget>[
                    Tab(
                      child: Text('文章'),
                    ),
                    Tab(
                      child: Text('收藏'),
                    ),
                  ],
                  labelColor: Color(0xFF333333), // 选中的颜色
                  labelPadding:
                      EdgeInsets.only(top: 4.0, left: 20.0, right: 20.0),
                  labelStyle: TextStyle(fontSize: 16),
                  unselectedLabelColor: Color(0xFF999999), // 未选中的颜色
                  indicatorColor: Color(0xFF00dcFF), // 底部切换线颜色
                  indicatorSize: TabBarIndicatorSize.label),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 0.2,
            color: Color(0xFFA9A9A9),
          ),
          Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 60.0),
              child: Text(
                '广告位招租，欢迎热爱代码的你',
                style: TextStyle(fontSize: 20.0),
              )),
          Container(
              width: 120.0,
              child: Consumer<PublicsStore>(
                  builder: (context, publicsStore, child) => ButtonMax(
                        btnText: '退出',
                        callback: () {
                          publicsStore.setToken('');
                        },
                      )))
        ],
      ),
    );
  }
}
