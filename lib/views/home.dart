import 'package:flutter/material.dart';
import './chatroom.dart';
import './publish.dart';
import './my.dart';
import '../model/chatroom.dart' as ChatRoomModel;

import 'package:provider/provider.dart';
import '../component/webview/base-webview.dart';
import '../store/publics.dart';

class _NavItem {
  String title;
  String key;
  IconData icon;
  Widget view;
  _NavItem(
      {@required this.title,
      @required this.key,
      @required this.icon,
      @required this.view});
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;
  final navList = [
    _NavItem(key: 'chatroom', title: '首页', icon: Icons.home, view: ChatRoom()),
    _NavItem(
        key: 'publush',
        title: '发表',
        icon: Icons.control_point,
        view: Publish()),
    _NavItem(key: 'my', title: '我的', icon: Icons.person_outline, view: My()),
  ];

  ChatRoomModel.Response res;

  @override
  void initState() {
    super.initState();
    WebviewStore.setWebView(BaseWebview(
      initialUrl: '',
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget bar;
    _selectedIndex == 0
        ? bar = AppBar(
            backgroundColor: Color(0xFF00dcFF),
            centerTitle: true,
            title: Text('Confenssion Wall',
                style: TextStyle(color: Colors.white.withOpacity(1.0))),
          )
        : null;

    return Scaffold(
      // header
      appBar: bar,
      body: SafeArea(
        child: Stack(
            children: navList.map((_NavItem item) {
          return Offstage(
            offstage: navList[_selectedIndex].key != item.key,
            child: item.view,
          );
        }).toList()),
      ),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        items: navList.map((_NavItem item) {
          return BottomNavigationBarItem(
              icon: Icon(item.icon), title: Text(item.title));
        }).toList(),
        currentIndex: _selectedIndex,
        fixedColor: Color(0xFF00dcFF),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}
