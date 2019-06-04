import 'package:flutter/material.dart';
import '../../model/chatroom.dart' as ChatRoomModel;
import '../../config.dart';

class ChatroomArticListItem extends StatelessWidget {
  ChatroomArticListItem({Key key, this.item})
      : assert(item != null),
        super(key: key);

  final ChatRoomModel.ListElement item;

  @override
  Widget build(BuildContext content) {
    return Container(
        padding: EdgeInsets.only(
          bottom: 10.0,
          top: 20.0,
        ),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 14, color: Color(0xFFF3F3F3)),
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // 头像
                Container(
                  width: 45.0,
                  height: 45.0,
                  margin: EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        '${baseUrl.toString()}${item.headimg}',
                      ),
                    ),
                    color: Color(0xFFF3F3F3),
                  ),
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
