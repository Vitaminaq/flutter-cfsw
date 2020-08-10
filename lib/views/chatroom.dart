import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/chatroom.dart';
import 'package:flutterdemo/model/chatroom.dart' as ChatRoomModel;
import 'package:flutterdemo/component/scroller.dart';
import 'package:flutterdemo/component/chatroom/chatroom-artic-list-item.dart';

class ChatRoomState extends State<ChatRoom> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext content) {
    return Consumer<ChatRoomStore>(builder: (context, chatRoomStore, child) {
      return Scroller<ChatRoomModel.Datum>(
        pullUp: chatRoomStore.pullUp,
        pullUpStatus: chatRoomStore.pullUpStatus,
        list: chatRoomStore.list,
        createlistItem: (item) => ChatroomArticListItem(item: item),
        pullDown: chatRoomStore.pullDown,
      );
    });
  }
}

class ChatRoom extends StatefulWidget {
  @override
  ChatRoomState createState() => ChatRoomState();
}
