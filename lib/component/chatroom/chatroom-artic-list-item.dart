import 'package:flutter/material.dart';
import 'package:flutterdemo/model/chatroom.dart' as ChatRoomModel;
import 'package:flutterdemo/utils/filter.dart';
import 'package:flutterdemo/router/index.dart';
import 'package:provider/provider.dart';
import 'package:flutterdemo/store/chatroom.dart';
import 'package:flutterdemo/store/publics.dart';
import 'package:flutterdemo/api/chatroom.dart';
import 'package:share/share.dart';
import 'package:flutterdemo/config.dart';
import 'package:flutterdemo/component/tools/comment.dart';

import './operate-item.dart';
import './list-image.dart';

class ChatroomArticListItem<ProviderStore extends ChatRoomStore>
    extends StatelessWidget {
  ChatroomArticListItem({Key key, this.item})
      : assert(item != null),
        super(key: key);

  final ChatRoomModel.Datum item;

  toDetail(BuildContext content) {
    router.push(content, '/artic/detail', params: {'item': item});
  }

  @override
  Widget build(BuildContext content) {
    final ArticReg articContent = formatContent(item.sorted_content);

    return GestureDetector(
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
                            '${item.user.avatar}',
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
                              '${item.user.name} ${time((item.created_at * 1000).toString())}',
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
                articContent.text == null
                    ? Padding(padding: EdgeInsets.all(0.0))
                    : Container(
                        width: MediaQuery.of(content).size.width,
                        padding:
                            EdgeInsets.only(top: 10.0, left: 26.0, right: 20.0),
                        child: Text(
                          articContent.text,
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
                articContent.images.length == 0
                    ? Padding(padding: EdgeInsets.all(0.0))
                    : Container(
                        padding: EdgeInsets.only(top: 16.0),
                        child: ListImage(articContent.images),
                      ),
                Container(
                  padding: EdgeInsets.only(top: 16.0, bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: OperateItem(
                        icon: 'lib/images/share.png',
                        callback: () => Share.share(
                            '【${item.title}】\n $baseH5/blog/detail?v=1.0.0#id=${item.id}'),
                      )),
                      Expanded(
                          child: Consumer<ProviderStore>(
                              builder: (context, providerStore, child) =>
                                  OperateItem(
                                    icon: 'lib/images/comment.png',
                                    count: item.comment_total_count,
                                    callback: () {
                                      if (item.comment_total_count == 0) {
                                        comment(content, {'note_id': item.id},
                                            () {
                                          providerStore
                                              .updateCommentCount(item.id);
                                        });
                                      } else {
                                        toDetail(content);
                                      }
                                    },
                                  ))),
                      Expanded(
                          child: Consumer<ProviderStore>(
                              builder: (context, providerStore, child) =>
                                  OperateItem(
                                    icon:
                                        'lib/images/parse${item.liked == true ? 'd' : ''}.png',
                                    count: item.like_count,
                                    callback: () async {
                                      final String token =
                                          await PublicsStore.getCurrentToken();
                                      if (token == null || token == '')
                                        return router.push(content, '/login');
                                      final r =
                                          await api.likeNote({'id': item.id});
                                      if (r.code != 1) return;
                                      providerStore.updateClickStatus(item.id);
                                    },
                                  ))),
                    ],
                  ),
                )
              ],
            )),
        onTap: () => toDetail(content));
  }
}
