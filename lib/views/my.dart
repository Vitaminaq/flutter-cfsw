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
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 15.0),),
              Container(
            width: 80.0,
            height: 80.0,
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
              Padding(padding: EdgeInsets.only(left: 15.0),),
              Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 8),),
                  Container(
                  //   height: 20,
                  //   child: Expanded(
                    padding: EdgeInsets.only(bottom: 12.0),
                     child: Text('只愿梦不醒，满城柳絮纷飞', style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),),
                  // ),
                  ),
                  Container(
                width: 270,
                height: 40,
                child: Row(
                children: <Widget>[
                  Expanded(
                    child:  Center(
                      child: Column(
                      children: <Widget>[
                        Text('2', style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),),
                        Text('关注', style: TextStyle(color: Color(0xFF666666), fontSize: 12.0),)
                      ],
                    )
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('0', style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),),
                        Text('粉丝', style: TextStyle(color: Color(0xFF666666), fontSize: 12.0),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                       Text('2', style: TextStyle(color: Color(0xFF333333), fontSize: 16.0),),
                        Text('获赞与收藏', style: TextStyle(color: Color(0xFF666666), fontSize: 12.0),)
                      ],
                    ),
                  )
                ],
              ),
              ) 
                ],
              )
              
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
            width: 500,
            child: Text('天地不仁，以万物为刍狗!'),
          ),
          Container(
            height: 0.2,
            color: Color(0xFFA9A9A9),
          )
        ],
      ),
      // padding: const EdgeInsets.only(top: 40.0),
      // child: Column(
      //   children: <Widget>[
      //     Center(
      //         child: Container(
      //       width: 60.0,
      //       height: 60.0,
      //       decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         image: DecorationImage(
      //           fit: BoxFit.cover,
      //           image: NetworkImage(
      //             'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1638079650,2146947483&fm=27&gp=0.jpg',
      //           ),
      //         ),
      //       ),
      //     ),
      //         ),
      //         Container(
      //           child: Text('只愿梦不醒，满城柳絮纷飞', style: TextStyle(fontSize: 16, color: Color(0xFF333333)),),
      //           padding: const EdgeInsets.only(top: 10.0, bottom: 24.0),
      //         ),
      //         Container(
      //           height: 1,
      //           color: Color(0xFFBCBCBC)
      //         ),
      //       Container(
      //         padding: EdgeInsets.all(20),
      //         width: 375,
      //         child: Row(children: <Widget>[
      //           Icon(Icons.account_balance_wallet, color: Color(0xFFADADAD),),
      //           Padding(padding: EdgeInsets.only(left: 20.0),),
      //           Text('我的钱包',
      //           style: TextStyle(
      //                 color: Color(0xFFADADAD),
      //                 fontSize: 18.0
      //                 ),),
      //         ],
      //         )
      //       ),
      //       Container(
      //           height: 1,
      //           color: Color(0xFFBCBCBC)
      //         ),
      //       Container(
      //         padding: EdgeInsets.all(20),
      //         width: 375,
      //         child: Row(
      //           children: <Widget>[
      //             Icon(Icons.collections, color: Color(0xFFADADAD),),
      //             Padding(padding: EdgeInsets.only(left: 20.0),),
      //             Text('我的收藏',
      //             style: TextStyle(
      //                 color: Color(0xFFADADAD),
      //                 fontSize: 18.0
      //                 ),),
      //           ],
      //         ) 
      //       ),
      //       Container(
      //           height: 1,
      //           color: Color(0xFFBCBCBC)
      //         ),
      //       Container(
      //         padding: EdgeInsets.all(20),
      //         width: 375,
      //         child: Row(
      //           children: <Widget>[
      //             Icon(Icons.contact_phone, color: Color(0xFFADADAD),),
      //             Padding(padding: EdgeInsets.only(left: 20.0),),
      //             Text('联系客服', 
      //               style: TextStyle(
      //                 color: Color(0xFFADADAD),
      //                 fontSize: 18.0
      //                 ),
      //               ),
      //             ],
      //           ) 
      //       ),
      //       Container(
      //           height: 1,
      //           color: Color(0xFFBCBCBC)
      //         ),
      //   ],
      // ),
    );
  }
}

class My extends StatefulWidget {
  @override
  MyState createState() => MyState();
}
