import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/chatroom.dart';
import 'package:flutterdemo/model/chatroom.dart' as ChatRoomModel;
import 'package:flutterdemo/component/scroller.dart';
import 'package:flutterdemo/component/chatroom/chatroom-artic-list-item.dart';

class TabTitle {
  String text;
  int value;

  TabTitle(this.text, this.value);
}

class ChatRoomState extends State<ChatRoom>
    with SingleTickerProviderStateMixin {
  TabController mController;
  List<TabTitle> tabList;

  @override
  initState() {
    super.initState();
    initTabData();
    mController =
        TabController(length: tabList.length, vsync: this, initialIndex: 0);
  }

  initTabData() {
    tabList = [TabTitle('必读', 0), TabTitle('热门', 1)];
  }

  @override
  Widget build(BuildContext content) {
    return Column(
      children: [
        Container(
            height: 38.0,
            padding: EdgeInsets.only(left: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  isScrollable: true,
                  //是否可以滚动
                  controller: mController,
                  indicatorColor: Color(0xff00c295),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Color(0xff303133),
                  unselectedLabelColor: Color(0xff606266),
                  labelStyle: TextStyle(fontSize: 18.0),
                  unselectedLabelStyle: TextStyle(fontSize: 16.0),
                  tabs: tabList.map((item) {
                    return Tab(
                      text: item.text,
                    );
                  }).toList()),
            )),
        Expanded(
          child: TabBarView(
            controller: mController,
            children: [
              Stack(
                children: <Widget>[
                  Consumer<MustStore>(builder: (context, mustStore, child) {
                    return Scroller<MustStore, ChatRoomModel.Datum>(
                      store: mustStore,
                      createlistItem: (item) =>
                          ChatroomArticListItem<MustStore>(item: item),
                    );
                  })
                ],
              ),
              Stack(
                children: <Widget>[
                  Consumer<HotStore>(builder: (context, hotStore, child) {
                    return Scroller<HotStore, ChatRoomModel.Datum>(
                      store: hotStore,
                      createlistItem: (item) =>
                          ChatroomArticListItem<HotStore>(item: item),
                    );
                  })
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ChatRoom extends StatefulWidget {
  @override
  ChatRoomState createState() => ChatRoomState();
}
