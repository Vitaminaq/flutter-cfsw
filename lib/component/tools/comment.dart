import 'package:flutter/material.dart';
import 'package:flutterdemo/router/index.dart';

import 'dart:io';
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:flutterdemo/component/tools/pick-image.dart';
import 'package:flutterdemo/utils/publics.dart';
import 'package:flutterdemo/api/webview.dart';
import 'package:flutterdemo/component/popup/toast.dart';

void Function(BuildContext, Map<String, dynamic>, [dynamic]) comment =
    (BuildContext context, Map<String, dynamic> params, [dynamic callback]) {
  showDialog<Null>(
      context: context, //BuildContext对象
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            router.back(context); //退出弹出框
          },
          child: CommentDialog(params: params, callback: callback),
        );
      });
};

class CommentDialog extends Dialog {
  final dynamic callback;
  final Map<String, dynamic> params;

  CommentDialog({Key key, @required this.callback, this.params})
      : assert(callback != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: GestureDetector(
          onTap: () {
            return false;
          },
          child: Stack(children: <Widget>[
            Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).viewInsets.bottom > 0
                    ? MediaQuery.of(context).viewInsets.bottom
                    : 0,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 10.0, bottom: 6.0),
                    decoration: BoxDecoration(color: Colors.white),
                    child: CommentContent(
                      params: params,
                      callback: callback,
                    )))
          ])),
    );
  }
}

class CommentContentState extends State<CommentContent> {
  String text;
  String currentValue = '';
  List<File> imgList = [];
  List<String> imgPaths = [];

  @override
  void initState() {
    super.initState();
  }

  addImage() {
    pickImageFromCameraOrAlbum(context, 3 - imgList.length,
        (PickImageResponse r) {
      if (r.files != null) {
        imgList.addAll(r.files);
      }
      if (r.paths != null) {
        imgPaths.addAll(r.paths);
      }
      setState(() {});
    });
  }

  comment() async {
    final Map<String, dynamic> params = widget.params;
    params['content'] = currentValue;
    if (imgPaths != null && imgPaths.length != 0) {
      final rr = await uploadQiNiu(imgPaths);
      if (rr == null || rr.length == 0) return;
      params['resource'] = json.encode(rr);
    }
    final r = await api.commentOrReply(params);
    if (r.code == 1) {
      toast(context, '评论成功');
      if (widget.callback != null) {
        widget.callback();
      }
    }
    // 回复
    router.back(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        imgList.length == 0
            ? Padding(padding: EdgeInsets.only(right: 0.0))
            : Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: imgList
                      .map(
                        (e) => Container(
                          height: 80.0,
                          width: 80.0,
                          margin: EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                e,
                              ),
                            ),
                            color: Color(0xFFF0F0F0),
                          ),
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Opacity(
                                  opacity: 0.3,
                                  child: Container(
                                    height: 13.0,
                                    width: 13.0,
                                    margin: EdgeInsets.all(4.0),
                                    padding: EdgeInsets.all(1.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff000000)),
                                    child: Image.asset(
                                      'lib/images/cancle-image.png',
                                      height: 10.0,
                                      width: 10.0,
                                    ),
                                  ),
                                )),
                            onTap: () {
                              imgList.remove(e);
                              setState(() {});
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 40.0,
          ),
          child: Container(
            padding: EdgeInsets.only(left: 6.0, right: 6.0, bottom: 4.0),
            decoration: BoxDecoration(color: Color(0xfff0f0f0)),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "说点什么",
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14.0, color: Color(0xff606266)),
              autofocus: true,
              cursorColor: Color(0xff00c295),
              scrollPadding: EdgeInsets.only(top: 0.0, bottom: 6.0),
              minLines: 2,
              maxLines: 3,
              onChanged: (v) {
                currentValue = v;
                setState(() {});
              },
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 4.0)),
        Row(
          children: <Widget>[
            Container(
                height: 30.0,
                width: 32.0,
                child: FlatButton.icon(
                    onPressed: addImage,
                    padding: EdgeInsets.all(0.0),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    highlightColor: Colors.white,
                    splashColor: Colors.white,
                    icon: Icon(
                      Icons.image,
                      color: Colors.grey,
                    ),
                    label: Text(''))),
            Expanded(child: Text('')),
            Container(
                height: 30.0,
                width: 40.0,
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  child: Text(
                    '发布',
                    style: TextStyle(
                        color: Color(currentValue.length == 0
                            ? 0xffbcbcbc
                            : 0xff00c295)),
                  ),
                  onPressed: () {
                    if (currentValue == '') return;
                    comment();
                  },
                ))
          ],
        )
      ],
    );
  }
}

class CommentContent extends StatefulWidget {
  final dynamic callback;
  final Map<String, dynamic> params;

  CommentContent({Key key, @required this.callback, this.params})
      : assert(callback != null),
        super(key: key);

  @override
  CommentContentState createState() => CommentContentState();
}
