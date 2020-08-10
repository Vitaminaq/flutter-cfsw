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
      return Scroller<ChatRoomStore, ChatRoomModel.Datum>(
        store: chatRoomStore,
        list: chatRoomStore.list,
        createlistItem: (item) => ChatroomArticListItem(item: item),
      );
    });
  }
}

class ChatRoom extends StatefulWidget {
  @override
  ChatRoomState createState() => ChatRoomState();
}
