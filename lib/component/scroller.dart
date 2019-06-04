import 'package:flutter/material.dart';

class ScrollerState<I> extends State<Scroller> {
  ScrollController _scrollController = new ScrollController();

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
    Widget header = widget.scrollerHeader;

    if (widget.pullUpStatus == 'pending') return Text('正在加载');
    print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
    print(widget.list.length);
    print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
    Widget box;
    box = ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: widget.list.length,
      itemBuilder: (BuildContext context, int index) {
        if (index < widget.list.length - 1) {
          return widget.createlistItem(widget.list[index]);
        }
        if (widget.pullUpStatus == 'pending')
          return Row(
            children: <Widget>[
              Image.asset(
                '../images/loading',
                height: 50,
                width: 100,
              )
            ],
          );
        if (widget.pullUpStatus == 'done') {
          return Container(
              padding: EdgeInsets.only(top: 20.0),
              height: 60,
              child: Text('无更多数据', textAlign: TextAlign.center));
        }
      },
      controller: _scrollController,
    );
    return RefreshIndicator(
      child: CustomScrollView(
        controller: _scrollController,
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(20.0),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10.0,
              crossAxisCount: 1,
              children: <Widget>[
                Text('He\'d have you all unravel at the'),
                box,
                Text('Revolution, they...'),
              ],
            ),
          ),
        ],
      ),
      // CustomScrollView(
      //   slivers: <Widget>[
      //     const SliverAppBar(
      //       pinned: true,
      //       expandedHeight: 250.0,
      //       flexibleSpace: FlexibleSpaceBar(
      //         title: Text('Demo'),
      //       ),
      //     ),
      //     SliverGrid(
      //       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //         maxCrossAxisExtent: 200.0,
      //         mainAxisSpacing: 10.0,
      //         crossAxisSpacing: 10.0,
      //         childAspectRatio: 4.0,
      //       ),
      //       delegate: SliverChildBuilderDelegate(
      //         (BuildContext context, int index) {
      //           return Container(
      //             alignment: Alignment.center,
      //             color: Colors.teal[100 * (index % 9)],
      //             child: Text('grid item $index'),
      //           );
      //         },
      //         childCount: 20,
      //       ),
      //     ),
      //     SliverFixedExtentList(
      //       itemExtent: 50.0,
      //       delegate: SliverChildBuilderDelegate(
      //         (BuildContext context, int index) {
      //           return Container(
      //             alignment: Alignment.center,
      //             color: Colors.lightBlue[100 * (index % 9)],
      //             child: Text('list item $index'),
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
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
