import 'package:flutter/material.dart';
import 'package:flutterdemo/component/popup/toast.dart';
// import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class CommentDialog extends Dialog {
  String text;
  String currentValue = '';
  dynamic callback;

  CommentDialog({Key key, this.text, this.callback}) : super(key: key);

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
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "说点什么", border: InputBorder.none),
                          autofocus: true,
                          cursorColor: Color(0xFF00dcFF),
                          onChanged: (v) {
                            currentValue = v;
                          },
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                                height: 30.0,
                                width: 32.0,
                                child: FlatButton.icon(
                                    onPressed: () {
                                      toast(context, '体验更多功能，请下载小獴阅读app');
                                    },
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
                                    style: TextStyle(color: Color(0xff00c295)),
                                  ),
                                  onPressed: () {
                                    if (currentValue == '') return;
                                    callback(currentValue);
                                  },
                                ))
                          ],
                        )
                      ],
                    )))
          ])),
    );
  }
}
