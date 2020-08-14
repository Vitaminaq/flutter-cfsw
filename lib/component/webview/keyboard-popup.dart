import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterdemo/component/tools/pick-image.dart';

class CommentDialog extends Dialog {
  final dynamic callback;

  CommentDialog({Key key, @required this.callback})
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
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(color: Colors.white),
                    child: CommentContent(
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  addImage() {
    pickImageFromCameraOrAlbum(context, (List<File> imgs) {
      imgList.addAll(imgs);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration:
              InputDecoration(hintText: "说点什么", border: InputBorder.none),
          autofocus: true,
          cursorColor: Color(0xFF00dcFF),
          onChanged: (v) {
            currentValue = v;
          },
        ),
        Row(
          children: <Widget>[
            imgList.length == 0
                ? Container(
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
                        label: Text('')))
                : Row(children: [
                    Row(
                      children: imgList
                          .map(
                            (e) => Container(
                              height: 50.0,
                              width: 50.0,
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
                            ),
                          )
                          .toList(),
                    ),
                    imgList.length > 0 && imgList.length < 3
                        ? GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              height: 49.0,
                              width: 49.0,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  border: Border.all(
                                      width: 0.5, color: Color(0xffcbcbcb))),
                              child: Image.asset(
                                'lib/images/add-image.png',
                                height: 20.0,
                                width: 20.0,
                              ),
                            ),
                            onTap: addImage,
                          )
                        : Padding(padding: EdgeInsets.only(left: 0.0))
                  ]),
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
                    style: TextStyle(color: Color(0xff00c295)),
                  ),
                  onPressed: () {
                    if (currentValue == '') return;
                    widget.callback(currentValue);
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

  CommentContent({Key key, @required this.callback})
      : assert(callback != null),
        super(key: key);

  @override
  CommentContentState createState() => CommentContentState();
}
