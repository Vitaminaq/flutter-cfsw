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
                  width: 50.0,
                  height: 50.0,
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
                              color: Color(0xFF333333)),
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
              padding: EdgeInsets.only(
                  left: 25.0, top: 5.0, right: 25.0, bottom: 20.0),
              child: Text(
                '在Flutter中，widget由其底层的RenderBox对象渲染。 渲染框由它们的父级给出约束，并且在这些约束下调整自身大小。约束由最小宽度、最大宽度和高度组成; 尺寸由特定的宽度和高度组成。',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                    letterSpacing: 1.0, // 每字空隙
                    fontSize: 15.0,
                    wordSpacing: 1.0, // 每句空隙
                    height: 1.2,
                    color: Color(0xFF333333)),
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
