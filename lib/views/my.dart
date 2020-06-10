import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/publics.dart';
import '../component/my/my-info.dart';
import '../component/my/my-login.dart';

class _NavItem {
  Widget view;
  String key;
  _NavItem({@required this.view, @required this.key});
}

class MyState extends State<My> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final navList = [
      _NavItem(key: 'my-info', view: MyInfo()),
      _NavItem(key: 'my-login', view: MyLogin()),
    ];
    return Consumer<PublicsStore>(builder: (context, publicsStore, child) {
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
