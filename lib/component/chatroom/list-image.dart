import 'package:flutter/material.dart';
import '../../router/index.dart';
import './image-view.dart';

class ListImage extends StatelessWidget {
  final List<String> imgList;
  ListImage(this.imgList);

  @override
  Widget build(BuildContext context) {
    final List<String> realList =
        imgList.length > 3 ? imgList.take(3).toList() : imgList;
    final int len = realList.length;
    if (len == 0) return Text('');
    return Container(
        padding: EdgeInsets.only(left: 26.0, right: 14.0),
        child: Row(
            children: realList
                .map((e) => Expanded(
                    child: Container(
                        padding: EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                            onTap: () {
                              showDialog<Null>(
                                  context: context, //BuildContext对象
                                  builder: (BuildContext context) {
                                    return GestureDetector(
                                        onTap: () {
                                          return router.back(context); //退出弹出框
                                        },
                                        child: ImageView(
                                            imgList, imgList.indexOf(e)));
                                  });
                            },
                            child: Container(
                                height:
                                    len == 1 ? 140.0 : len == 2 ? 120.0 : 100.0,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(e),
                                  ),
                                ))))))
                .toList()));
  }
}
