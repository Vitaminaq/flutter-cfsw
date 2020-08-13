import 'package:flutter/material.dart';
import 'package:flutterdemo/model/api.dart';

class ScrollerState<I> extends State<Scroller> {
  final ScrollController _scrollController = ScrollController(
    keepScrollOffset: true,
  );

  List<I> get list => widget.store.list;
  BaseListLoadStatus get pullUpStatus => widget.store.pullUpStatus;
  BaseListParams get params => widget.store.params;
  Function get pullDown => widget.store.pullDown;
  Function get pullUp => widget.store.pullUp;

  @override
  initState() {
    super.initState();
    Future.microtask(() => initListen());
  }

  initListen() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          pullUpStatus != BaseListLoadStatus.done) {
        pullUp();
      }
    });
    if (params.page < 2) {
      pullDown();
    }
  }

  @override
  Widget build(BuildContext content) {
    final int len = list.length + 1;
    Widget box;
    box = ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: len,
      itemBuilder: (BuildContext context, int index) {
        if (index < len - 1) {
          return widget.createlistItem(list[index]);
        }
        if (index == len - 1) {
          if (pullUpStatus == BaseListLoadStatus.done) {
            return Container(
                padding: EdgeInsets.only(top: 20.0),
                height: 60,
                child: Text(
                  '无更多数据',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xffadadad), fontSize: 12.0),
                ));
          }
          if (pullUpStatus == BaseListLoadStatus.error) {
            return Container(
              padding: EdgeInsets.only(top: 20.0),
              height: 60,
              child: GestureDetector(
                child: Text('加载失败，请点击重试', textAlign: TextAlign.center),
                onTap: () => pullUp(),
              ),
            );
          }
          return Container(
              height: 60.0,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'lib/images/loading.gif',
                  height: 34.0,
                  width: 34.0,
                ),
              ));
        }
        return null;
      },
      controller: _scrollController,
    );
    return RefreshIndicator(
      child: box,
      color: Color(0xFF00c295),
      onRefresh: () {
        return pullDown();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}

class Scroller<S, I> extends StatefulWidget {
  Scroller(
      {Key key,
      @required this.store,
      @required this.createlistItem,
      this.scrollerHeader,
      this.scrollerFooter})
      : assert(store != null),
        assert(createlistItem != null),
        super(key: key);

  final S store;
  final Function createlistItem;
  final Widget scrollerHeader;
  final Widget scrollerFooter;

  @override
  ScrollerState createState() => ScrollerState<I>();
}
