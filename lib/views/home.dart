import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutterdemo/store/publics.dart';
import 'package:flutterdemo/component/popup/toast.dart';
import 'package:flutterdemo/component/tab-bar.dart';
import './chatroom.dart';
import './read.dart';
import './my.dart';

class HomeState extends State<Home> {
  NavItemKey _currentKey = NavItemKey.chatroom;
  final navList = [
    NavItem(
        key: NavItemKey.chatroom,
        title: '首页',
        icon: Icons.home,
        view: ChatRoom(),
        isInit: true),
    NavItem(key: NavItemKey.read, title: '阅读', icon: Icons.book, view: Read()),
    NavItem(
        key: NavItemKey.my,
        title: '我',
        icon: Icons.person_outline,
        view: My(),
        isInit: true),
  ];
  DateTime lastPopTime;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  getUserInfo() {
    PublicsStore.getCurrentToken().then((token) => {
          if (token != null)
            {Provider.of<PublicsStore>(context, listen: false).getUserInfo()}
        });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: WillPopScope(
        child: Scaffold(
            body: SafeArea(
              child: Stack(
                  children: navList.map((NavItem item) {
                return Offstage(
                  offstage: _currentKey != item.key,
                  child: item.isInit ? item.view : Text(''),
                );
              }).toList()),
            ),
            // 底部导航栏
            bottomNavigationBar: MyTabBar(
              navList: navList,
              onTap: _onItemTapped,
              currentKey: _currentKey,
            )),
        onWillPop: () async {
          if (lastPopTime == null ||
              DateTime.now().difference(lastPopTime) > Duration(seconds: 1)) {
            lastPopTime = DateTime.now();
            toast(context, '再次点击退出应用');
            return Future.value(false);
          }
          return Future.value(true);
        },
      ),
    );
  }

  void _onItemTapped(NavItemKey key) async {
    _currentKey = key;
    setState(() {});
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}
