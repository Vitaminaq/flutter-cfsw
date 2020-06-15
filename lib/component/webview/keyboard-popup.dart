import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingDialog extends Dialog {
  String text;

  LoadingDialog({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Align(
        alignment: Alignment.bottomCenter,
        child: new Row(
          children: <Widget>[Container(child: Text('哈哈哈哈'))],
        ),
      ),
    );
  }
}

// showModalBottomSheet(
//   context: options.context,
//   isScrollControlled: true,
//   builder: (BuildContext context) {
//     GlobalKey _formKey = new GlobalKey<FormState>();
//     TextEditingController _inputController = new TextEditingController();
//     String inputText = '';

//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Form(
//                 key: _formKey,
//                 autovalidate: false,
//                 child: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.all(10),
//                       child: TextFormField(
//                         controller: _inputController,
//                         decoration: InputDecoration(hintText: '说点什么...'),
//                         autofocus: true,
//                         onSaved: (val) {
//                           inputText = val;
//                         },
//                       ),
//                     ),
//                     FlatButton(
//                       child: Text('发表'),
//                       onPressed: () {
//                         FormState _form = _formKey.currentState;
//                         _form.save();
//                         final len = inputText.trim().length;
//                         if (len < 1) return;
//                         // final params = H5Response(data: inputText)
//                         //     .toJson()
//                         //     .toString();
//                         final params = "{'code': 0,'data': '$inputText'}";
//                         options.controller.evaluateJavascript(
//                             '__app_native_callback__["${reslut.resolveName}"]($params)');
//                         router.back(context);
//                       },
//                     )
//                   ],
//                 )),
//           ],
//         ),
//       ),
//     );
//   },
// );
