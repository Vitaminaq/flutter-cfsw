import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../store/index.dart';
import '../model/chatroom.dart' as ChatRoomModel;

class MyState extends State<My> {
  ChatRoomModel.State state;
  mapState(s) {
    setState(() {
      state = s;
    });
  }

  @override
  initState() {
    super.initState();
    print('my初始化');
    chatRoomStore.subscribe('my', mapState);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: <Widget>[
          Center(
              // child: DecoratedBox(
              //   child:
              //     Image.network(
              //       'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1638079650,2146947483&fm=27&gp=0.jpg',
              //       height: 50,
              //       width: 50,
              //       fit: BoxFit.cover
              //     ),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(
              //       const Radius.circular(50.0),
              //     ),),
              // ),
              child: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1638079650,2146947483&fm=27&gp=0.jpg',
                ),
              ),
            ),
          )
              //   child: Container(
              //     height: 50,
              //     width: 50,
              //     child:
              //     Image.network(
              //       'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1638079650,2146947483&fm=27&gp=0.jpg',
              //       height: 50,
              //       width: 50,
              //       fit: BoxFit.cover),
              //     decoration: new BoxDecoration(
              //       color: Colors.red[400],
              //       borderRadius: new BorderRadius.all(
              //         const Radius.circular(50.0),
              //       ),
              //     ),
              // )
              )
        ],
      ),
    );
  }
}

class My extends StatefulWidget {
  @override
  MyState createState() => MyState();
}
