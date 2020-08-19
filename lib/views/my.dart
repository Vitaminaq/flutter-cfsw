import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutterdemo/store/publics.dart';
import 'package:flutterdemo/component/my/my-info.dart';
import 'package:flutterdemo/component/my/my-login.dart';

class _NavItem {
  Widget view;
  String key;
  _NavItem({@required this.view, @required this.key});
}

class MyState extends State<My> {
  final navList = [
    _NavItem(key: 'my-info', view: MyInfo()),
    _NavItem(key: 'my-login', view: MyLogin()),
  ];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PublicsStore>(builder: (context, publicsStore, child) {
      publicsStore.getToken();
      int _selectedIndex = publicsStore.isLogin ? 0 : 1;
      return Stack(
        children: navList.map((_NavItem item) {
          return Offstage(
            offstage: navList[_selectedIndex].key != item.key,
            child: item.view,
          );
        }).toList(),
      );
    });
  }
}

class My extends StatefulWidget {
  @override
  MyState createState() => MyState();
}
