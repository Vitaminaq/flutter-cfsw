import 'package:flutter/material.dart';

class NavItemKey {
  const NavItemKey(this.key) : assert(key != null);

  final String key;

  static const NavItemKey chatroom = NavItemKey('chatroom');
  static const NavItemKey read = NavItemKey('read');
  static const NavItemKey my = NavItemKey('my');
}

class NavItem {
  String title;
  NavItemKey key;
  IconData icon;
  bool isInit;
  Widget view;
  NavItem(
      {@required this.title,
      @required this.key,
      @required this.icon,
      @required this.view,
      this.isInit = false});

  init() {
    isInit = true;
  }
}

// 底部tab导航
class MyTabBar<I> extends StatelessWidget {
  final List<NavItem> navList;
  final Function onTap;
  final NavItemKey currentKey;

  MyTabBar(
      {Key key, @required this.navList, this.onTap, @required this.currentKey})
      : assert(navList != null),
        assert(currentKey != null),
        super(key: key);

  bool isCurrent(NavItemKey key) {
    return currentKey == key ? true : false;
  }

  @override
  Widget build(BuildContext content) {
    return Container(
        height: 44.0,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Color(0xFFF3F3F3)),
          ),
        ),
        child: Row(
          children: navList.map((NavItem item) {
            return Expanded(
              flex: 1,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        size: 26.0,
                        color: isCurrent(item.key)
                            ? Color(0xff00c295)
                            : Color(0xffcbcbcb),
                      ),
                      Text(
                        item.title,
                        style: TextStyle(
                            fontSize: 10.0,
                            color: isCurrent(item.key)
                                ? Color(0xff00c295)
                                : Color(0xffcbcbcb)),
                      )
                    ]),
                onTap: () {
                  if (onTap == null || item.key == currentKey) return;
                  item.init();
                  return onTap(item.key);
                },
              ),
            );
          }).toList(),
        ));
  }
}
