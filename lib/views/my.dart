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
              child: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1638079650,2146947483&fm=27&gp=0.jpg',
                ),
              ),
            ),
          ),
              ),
            Container(
              padding: EdgeInsets.all(20),
              width: 375,
              child: Text('jkfdshfkdshkfds'),
              
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
