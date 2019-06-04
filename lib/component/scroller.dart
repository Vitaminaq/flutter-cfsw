import 'package:flutter/material.dart';

class ScrollerState<I> extends State<Scroller> {
  final ScrollController _scrollController = new ScrollController();

  @override
  initState() {
    super.initState();
    widget.pullDown();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (widget.pullUpStatus == 'done') return '';
        return widget.pullUp();
      }
    });
  }

  @override
  Widget build(BuildContext content) {
    final int len = widget.list.length + 1;
    Widget box;
    box = ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: len,
      itemBuilder: (BuildContext context, int index) {
        if (index < len - 1) {
          return widget.createlistItem(widget.list[index]);
        }
        if (index == len - 1) {
          if (widget.pullUpStatus == 'done') {
            return Container(
                padding: EdgeInsets.only(top: 20.0),
                height: 60,
                child: Text('无更多数据', textAlign: TextAlign.center));
          }
          if (widget.pullUpStatus == 'error') {
            return Container(
              padding: EdgeInsets.only(top: 20.0),
              height: 60,
              // child: FlatButton(
              child: Text('加载失败，请点击重试', textAlign: TextAlign.center),
              // onPressed: () => widget.pullUp(),
              // ),
            );
          }
          return Row(
            children: <Widget>[
              Image.asset(
                'lib/images/loading.gif',
                height: 50,
                width: 100,
              )
            ],
          );
        }
      },
      controller: _scrollController,
    );
    return RefreshIndicator(
      child: box,
      onRefresh: () {
        return widget.pullDown();
      },
    );
  }
}

class Scroller<I> extends StatefulWidget {
  Scroller(
      {Key key,
      @required this.pullUp,
      @required this.createlistItem,
      @required this.pullUpStatus,
      @required this.list,
      this.pullDown,
      this.scrollerHeader,
      this.scrollerFooter})
      : assert(pullUp != null),
        assert(createlistItem != null),
        assert(pullUpStatus != null),
        assert(list != null),
        super(key: key);

  final Function pullUp;
  final Function createlistItem;
  final String pullUpStatus;
  final List<I> list;
  final Function pullDown;
  final Widget scrollerHeader;
  final Widget scrollerFooter;

  @override
  ScrollerState createState() => ScrollerState<I>();
}
