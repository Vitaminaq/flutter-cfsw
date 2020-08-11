import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './chatroom.dart';
import './my.dart';

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
    _NavItem(key: 'my', title: '我的', icon: Icons.person_outline, view: My()),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
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
            fixedColor: Color(0xFF00c295),
            onTap: _onItemTapped,
          ),
        ));
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
