import 'package:flutter/material.dart';
import 'package:flutterdemo/model/chatroom.dart' as ChatRoomModel;
import 'package:flutterdemo/config.dart';
import 'package:flutterdemo/utils/filter.dart';
import 'package:flutterdemo/router/index.dart';

class ChatroomArticListItem extends StatelessWidget {
  ChatroomArticListItem({Key key, this.item})
      : assert(item != null),
        super(key: key);

  final ChatRoomModel.ListElement item;

  @override
  Widget build(BuildContext content) {
    return FlatButton(
        padding: EdgeInsets.all(0),
        child: Container(
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
                      width: 46.0,
                      height: 46.0,
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
                            padding: EdgeInsets.only(left: 10.0),
                            width: 280,
                            child: Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333333),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          Container(
                            width: 256,
                            padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
                            child: Text(
                              '大飞哥 ${time(item.creatAt)}',
                              style: TextStyle(
                                color: Color(0xFF999999),
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 340,
                  padding: EdgeInsets.only(top: 5.0, bottom: 20.0),
                  child: Text(
                    item.msg,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                        letterSpacing: 1.0, // 每字空隙
                        fontSize: 15.0,
                        wordSpacing: 1.0, // 每句空隙
                        height: 1.2,
                        color: Color(0xFF444444)),
                  ),
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
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFFbcbcbc))),
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
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFFbcbcbc)))
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
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFFbcbcbc)))
                      ],
                    ))
                  ],
                )
              ],
            )),
        onPressed: () => router.toArticDetail(content));
  }
}
