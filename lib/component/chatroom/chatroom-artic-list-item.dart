import 'package:flutter/material.dart';
import 'package:flutterdemo/model/chatroom.dart' as ChatRoomModel;
import 'package:flutterdemo/config.dart';
import 'package:flutterdemo/utils/filter.dart';

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
        decoration: BoxDecoration(
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
                      Container(
                        padding: EdgeInsets.only(left: 20.0),
                        width: 300,
                        child: Text(
                          item.title,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF333333)),
                        ),
                      ),
                      Row(
                        // direction: Axis.horizontal,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomLeft,
                            // padding: EdgeInsets.only(top: 10),
                            child: Text(
                              '大飞哥',
                              style: TextStyle(
                                color: Color(0xFF999999),
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          Align(
                            // padding: EdgeInsets.only(top: 10),
                            child: Text(
                              time(item.creatAt),
                              style: TextStyle(
                                color: Color(0xFF999999),
                                fontSize: 12.0,
                              ),
                            ),
                          )
                        ],
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
