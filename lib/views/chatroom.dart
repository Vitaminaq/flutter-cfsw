import 'package:flutter/material.dart';
import '../store/index.dart';
import '../model/chatroom.dart' as ChatRoomModel;
import '../component/scroller.dart';
import '../component/chatroom/chatroom-artic-list-item.dart';

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
