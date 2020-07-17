import 'package:flutter/material.dart';
import 'package:flutterdemo/model/chatroom.dart' as ChatRoomModel;
import 'package:flutterdemo/config.dart';
import 'package:flutterdemo/utils/filter.dart';
import 'package:flutterdemo/router/index.dart';
import 'package:flutterdemo/api/chatroom.dart';
import 'package:flutterdemo/store/chatroom.dart';
import 'package:provider/provider.dart';
import './list-image.dart';

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
                            '${baseUrl.toString()}:3005${item.headimg}',
                          ),
                        ),
                        color: Color(0xFFF3F3F3),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10.0, top: 8.0),
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
                              '${item.nickname} ${time(item.creatAt)}',
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
                  width: MediaQuery.of(content).size.width,
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 16.0, left: 26.0, right: 20.0),
                  child: Text(
                    item.msgText,
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
                ListImage(item.imgList),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Consumer<ChatRoomStore>(
                            builder: (context, chatRoomStore, child) =>
                                FlatButton(
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.thumb_up,
                                        color: item.isClick
                                            ? Color(0xFF00dcFF)
                                            : Color(0xFFbcbcbc),
                                        size: 20.0,
                                      ),
                                      Text(item.clicknum.toString(),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFFbcbcbc))),
                                    ],
                                  ),
                                  onPressed: () async {
                                    final r =
                                        await api.clickIt({'id': item.articId});
                                    if (r.code == 0) {
                                      chatRoomStore
                                          .updateClickStatus(item.articId);
                                    }
                                  },
                                ))),
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
        onPressed: () =>
            router.push(content, '/artic/detail', params: {'item': item}));
  }
}
