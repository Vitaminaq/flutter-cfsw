import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutterdemo/model/chatroom.dart' as ChatRoomModel;
import '../store/chatroom.dart';
import 'package:flutterdemo/component/scroller.dart';
import 'package:flutterdemo/component/chatroom/chatroom-artic-list-item.dart';

class Read extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReadStore>(builder: (context, readStore, child) {
      return Scroller<ReadStore, ChatRoomModel.Datum>(
        store: readStore,
        createlistItem: (item) => ChatroomArticListItem<ReadStore>(item: item),
      );
    });
  }
}
