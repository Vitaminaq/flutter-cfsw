import 'package:flutter/material.dart';
import 'package:flutterdemo/store/index.dart';
import 'package:flutterdemo/model/chatroom.dart' as ChatRoomModel;
import 'package:flutterdemo/component/scroller.dart';
import 'package:flutterdemo/component/chatroom/chatroom-artic-list-item.dart';

class ChatRoomState extends State<ChatRoom> {
  ChatRoomModel.Response res;
  ChatRoomModel.State state;

  mapState(s) {
    setState(() {
      state = s;
    });
  }

  @override
  initState() {
    super.initState();
    chatRoomStore.subscribe('chatroom', mapState);
  }

  @override
  Widget build(BuildContext content) {
    return Scroller<ChatRoomModel.ListElement>(
      pullUp: chatRoomStore.pullUp,
      pullUpStatus: state.requestStatus,
      list: state.list,
      createlistItem: (item) => ChatroomArticListItem(item: item),
      pullDown: chatRoomStore.pullDown,
    );
  }
}

class ChatRoom extends StatefulWidget {
  @override
  ChatRoomState createState() => ChatRoomState();
}
