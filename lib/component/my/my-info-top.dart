import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutterdemo/store/publics.dart';

class MyInfoTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PublicsStore>(builder: (context, publicsStore, child) {
      if (publicsStore.user == null) return Text('');
      return Container(
        padding: EdgeInsets.only(left: 16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(publicsStore.user.avatar),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 16.0)),
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${publicsStore.user.name}',
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 19.0),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${publicsStore.schoolInfo}',
                        style:
                            TextStyle(color: Color(0xFF606266), fontSize: 12.0),
                      ),
                    )
                  ],
                )),
                GestureDetector(
                  child: Container(
                      padding: EdgeInsets.only(right: 16.0, bottom: 46.0),
                      child: Image.asset(
                        'lib/images/loginout.png',
                        height: 20.0,
                        width: 20.0,
                      )),
                  onTap: () {
                    publicsStore.setToken('');
                  },
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
              width: 500,
              child: Text(
                '此用户很懒，并没有留下什么!',
                style: TextStyle(color: Color(0xFF606266), fontSize: 13.0),
              ),
            )
          ],
        ),
      );
    });
  }
}
