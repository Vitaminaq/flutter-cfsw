import 'package:flutter/material.dart';
import '../store/index.dart';
import '../model/chatroom.dart' as ChatRoomModel;

import '../component/scroller.dart';

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
    print('publish初始化');
    chatRoomStore.subscribe('publish', mapState);
  }

  @override
  Widget build(BuildContext context) {
    print(state.toString() +
        'publish>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    return Scroller<String>(
      pullUp: () {
        print('123');
        return 1;
      },
      pullUpStatus: 'success',
      createlistItem: (String item) => Text(item),
      list: ['1', '2', '3'],
      pullDown: () {},
    );
  }
}

class Publish extends StatefulWidget {
  @override
  PublishState createState() => PublishState();
}
