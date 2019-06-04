import 'package:flutter/material.dart';
import '../store/index.dart';
import '../model/chatroom.dart' as ChatRoomModel;

class PublishState extends State<Publish> {
  ChatRoomModel.State state;
  mapState(s) {
    setState(() {
      state = s;
    });
  }

  @override
  initState() {
    super.initState();
    chatRoomStore.subscribe('publish', mapState);
  }

  @override
  Widget build(BuildContext context) {
    return Text('1233');
  }
}

class Publish extends StatefulWidget {
  @override
  PublishState createState() => PublishState();
}
