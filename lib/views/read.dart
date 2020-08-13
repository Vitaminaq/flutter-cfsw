import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutterdemo/model/read.dart' as ReadModel;
import 'package:flutterdemo/store/read.dart';
import 'package:flutterdemo/component/scroller.dart';
import 'package:flutterdemo/component/read/read-book-item.dart';

class Read extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReadStore>(builder: (context, readStore, child) {
      return Column(
        children: [
          Container(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              alignment: Alignment.topLeft,
              child: Text(
                '阅读',
                style: TextStyle(
                    color: Color(0xff303133),
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700),
              )),
          Expanded(
              child: Scroller<ReadStore, ReadModel.Datum>(
            store: readStore,
            createlistItem: (item) => ReadBookItem(
              item: item,
            ),
          ))
        ],
      );
    });
  }
}
