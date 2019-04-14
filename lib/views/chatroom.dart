import 'package:flutter/material.dart';
import '../store/index.dart';
import '../model/chatroom.dart' as ChatRoomModel;

class ChatRoomState extends State<ChatRoom> {
  ChatRoomModel.Response res;
  ScrollController _scrollController = new ScrollController();
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
    chatRoomStore.pullDown();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
          if (state.requestStatus == 'done') return '';
        return chatRoomStore.pullUp();
      }
    });
  }

  @override
  Widget build(BuildContext content) {
    if (state == null || state.list == null) return Text('正在加载');
    print(state.list.length.toString() + '+++++++++++++++++++++++++++++++++');
    Widget box;
    box = ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: state.list.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (state.list.length - 1 < index && state.requestStatus != 'done')
          return Row(
            children: <Widget>[Text('加载中...')],
          );
        if (state.list.length - 1 < index && state.requestStatus == 'done') {
          return Row(
            children: <Widget>[Text('无更多数据')],
          );
        }
        return _buildRow(state.list[index]);
      },
      controller: _scrollController,
    );
    return RefreshIndicator(
      child: box,
      onRefresh: () {
        chatRoomStore.pullDown();
        return;
      },
    );
  }

  Widget _buildRow(ChatRoomModel.ListElement item) {
    return Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: Color(0xFFbcbcbc)),
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  height: 50.0,
                  margin: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child:
                      Image.network('http://192.168.0.102:3005${item.headimg}'),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(item.title),
                      Row(
                        children: <Widget>[Text('大飞哥'), Text(item.creatAt)],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.thumb_up,
                      color: Color(0xFFbcbcbc),
                      size: 20.0,
                    ),
                    Text(item.clicknum.toString(),
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFFbcbcbc))),
                  ],
                )),
                Expanded(
                    child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.comment,
                      color: Color(0xFFbcbcbc),
                      size: 20.0,
                    ),
                    Text(item.commentnum.toString(),
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFFbcbcbc)))
                  ],
                )),
                Expanded(
                    child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.view_agenda,
                      color: Color(0xFFbcbcbc),
                      size: 20.0,
                    ),
                    Text(item.viewnum.toString(),
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFFbcbcbc)))
                  ],
                ))
              ],
            )
          ],
        ));
  }
}

class ChatRoom extends StatefulWidget {
  @override
  ChatRoomState createState() => ChatRoomState();
}
