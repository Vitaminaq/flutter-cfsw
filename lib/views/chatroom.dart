import 'package:flutter/material.dart';
import '../api/chatroom.dart';
import '../model/chatroom.dart' as ChatRoomModel;

class ChatRoomState extends State<ChatRoom> {
  ChatRoomModel.Response res;
  final _biggerFont = const TextStyle(fontSize: 18.0);
  ScrollController _scrollController = new ScrollController();
  final params = {'limit': 12, 'page': 0};

  Future getData() async {
    ChatRoomModel.Response r = await api.getArtic(params);
    setState(() {
      if (params['page'] == 0) {
        res = r;
      } else {
        res.data.list.addAll(r.data.list);
      }
      params['page']++;
    });
    return;
  }

  @override
  initState() {
    super.initState();
    getData();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        await getData();
      }
    });
  }

  @override
  Widget build(BuildContext content) {
    Widget box;
    if (res == null || res.code == null || res.code != 0) {
      box = Center(
          child: Container(
        child: Text('加载失败，请重试'),
      ));
    } else {
      box = ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: res.data.list.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (res.data.list.length - 1 < index)
            return Row(
              children: <Widget>[Text('加载中...')],
            );
          return _buildRow(res.data.list[index]);
        },
        controller: _scrollController,
      );
    }
    return RefreshIndicator(
      child: box,
      onRefresh: () {
        setState(() {
          params['page'] = 0;
        });
        getData();
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
                      Image.network('http://192.168.0.120:3005${item.headimg}'),
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
