import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../store/index.dart';
import '../model/chatroom.dart' as ChatRoomModel;

class MyState extends State<My> {
  ChatRoomModel.State state;
  mapState(s) {
    setState(() {
      state = s;
    });
  }

  @override
  initState() {
    super.initState();
    print('my初始化');
    chatRoomStore.subscribe('my', mapState);
  }

  @override
  Widget build(BuildContext context) {
    print(state.params.page.toString() +
        'My>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    return Text(state.params.page.toString());
  }
}

class My extends StatefulWidget {
  @override
  MyState createState() => MyState();
}
