import 'package:flutter/material.dart';

class ScrollerState<I> extends State<Scroller> {
  ScrollController _scrollController = new ScrollController();
  ScrollerState({
      Key key,
      @required this.pullUp,
      @required  this.createlistItem,
      @required this.pullUpStatus,
      @required this.list
    }):assert(pullUp != null ),
    assert(createlistItem != null),
    assert(pullUpStatus != null),
    assert(list != null);

  final Function pullUp;
  final Function createlistItem;
  final String pullUpStatus;
  final List<I> list;
  
   @override
  initState() {
    super.initState();
    pullUp();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (pullUpStatus == 'done') return '';
        return pullUp();
      }
    });
  }
  
   @override
  Widget build(BuildContext content) {
    if (pullUpStatus == 'pending') return Text('正在加载');
    Widget box;
    box = ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        if (pullUpStatus == 'pending')
          return Row(
            children: <Widget>[
              // Image.asset(
              //   '../images/loading',
              //   height: 50,
              //   width: 100,
              // )
              Text('加载中')
            ],
          );
        if (pullUpStatus == 'done') {
          return Container(
              padding: const EdgeInsets.only(top: 20.0),
              height: 60,
              child: Text('无更多数据', textAlign: TextAlign.center));
        }
        return createlistItem(list[index]);
      },
      controller: _scrollController,
    );
    return RefreshIndicator(
      child: box,
      onRefresh: () {
        return pullUp();
      },
    );
  }
}

class Scroller<I> extends StatefulWidget {
  Scroller({
      Key key,
      @required this.pullUp,
      @required this.createlistItem,
      @required this.pullUpStatus,
      @required this.list
    }):assert(pullUp != null ),
    assert(createlistItem != null),
    assert(pullUpStatus != null),
    assert(list != null),
    super(key: key);

  final Function pullUp;
  final Function createlistItem;
  final String pullUpStatus;
  final List<I> list;

  @override
  ScrollerState createState() => ScrollerState<I>(
    pullUp: this.pullUp,
    createlistItem: this.createlistItem,
    pullUpStatus: this.pullUpStatus,
    list: this.list
  );
}