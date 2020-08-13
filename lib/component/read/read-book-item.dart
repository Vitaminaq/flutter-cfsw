import 'package:flutter/material.dart';
import 'package:flutterdemo/model/read.dart' as ReadModal;
import 'package:flutterdemo/utils/filter.dart';
import 'package:flutterdemo/component/popup/toast.dart';
import 'package:flutterdemo/router/index.dart';
import 'package:flutterdemo/store/publics.dart';

import 'read-book-label.dart';

class ReadBookItem extends StatelessWidget {
  ReadBookItem({Key key, this.item})
      : assert(item != null),
        super(key: key);

  final ReadModal.Datum item;

  String get gradesText {
    if (item.bookGrades == null || item.bookGrades.length == 0) return '';
    String str = '';
    item.bookGrades.forEach((i) {
      str = str + toChineseNumber(i.gradeId) + '年级,';
    });
    return str.substring(0, str.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xFFF3F3F3)),
          ),
        ),
        child: Row(children: [
          Container(
            width: 100.0,
            height: 130.0,
            margin: EdgeInsets.only(right: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  '${item.imgUrl}',
                ),
              ),
              color: Color(0xFFF3F3F3),
            ),
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item.bookName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Color(0xff303133),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Text(
                    '作者：${item.author}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xff909399), fontSize: 12.0),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 5.0)),
                  Text('适用年级：$gradesText',
                      style:
                          TextStyle(color: Color(0xff909399), fontSize: 12.0)),
                  Row(
                      children: item.bookLabels
                          .take(2)
                          .map((i) => ReadBookLabel(i.name))
                          .toList()),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Row(children: [
                    Container(
                        margin: EdgeInsets.only(top: 1.0),
                        child: Text(
                          item.readCount.toString(),
                          style: TextStyle(
                              color: Color(0xff12dba5), fontSize: 12.0),
                        )),
                    Text(
                      '人正在阅读',
                      style:
                          TextStyle(color: Color(0xff606266), fontSize: 12.0),
                    )
                  ])
                ]),
          )
        ]),
      ),
      onTap: () async {
        if (item.hadTheater == false)
          return toast(context, '请下载小獴阅读app解锁更多书籍闯关');
        final String token = await PublicsStore.getCurrentToken();
        if (token == null || token == '') return router.push(context, '/login');
        router.push(context, '/chuangguan',
            params: {'bookid': item.id, 'token': token});
      },
    );
  }
}
