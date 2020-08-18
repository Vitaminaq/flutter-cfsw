import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/router/index.dart';

class CupertinoActionSheetOptions {
  final List<dynamic> items;
  final void Function(int) callback;
  final String title;
  final String message;

  CupertinoActionSheetOptions(
      {@required this.items, this.callback, this.title, this.message});
}

// 底部普通弹出菜单 - ios风格
void Function(BuildContext, CupertinoActionSheetOptions) bottomSheet =
    (BuildContext context, CupertinoActionSheetOptions options) {
  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext ctx) {
        return CupertinoActionSheet(
          // title: options.title == null
          //     ? Padding(
          //         padding: EdgeInsets.only(left: 0.0),
          //       )
          //     : Text(options.title),
          // message: options.message == null
          //     ? Padding(
          //         padding: EdgeInsets.only(left: 0.0),
          //       )
          //     : Text(options.message),
          cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                router.back(context);
              },
              child: Text(
                '取消',
                style: TextStyle(color: Color(0xffcdcdcd)),
              )),
          actions: options.items
              .map((item) => CupertinoActionSheetAction(
                  onPressed: () {
                    final int idx = options.items.indexOf(item);
                    if (options.callback != null) {
                      options.callback(idx);
                    }
                    router.back(context, idx);
                  },
                  child: Text(item.toString())))
              .toList(),
        );
      });
  return;
};

// showModalBottomSheet(
//   context: context,
//   builder: (BuildContext context) {
//     return IntrinsicHeight(
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(16.0))),
//         child: Column(children: [SheetItem(), SheetItem(), SheetItem()]),
//       ),
//     );
//   },
// );
class SheetItem extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Color(0xFFF3F3F3)),
        ),
      ),
      child: Text('选项一'),
    );
  }
}
