import 'package:flutter/foundation.dart';
import '../model/chatroom.dart';

class BaseParams {
  int limit = 9;
  int page = 0;

  Map<String, dynamic> toJson() => {
        "limit": limit == null ? null : limit,
        "page": page == null ? null : page,
      };
}

class BaseState<I> {
  BaseParams params = BaseParams();
  List<ListElement> list = [];
  String requestStatus = 'unrequest';
}

abstract class LoaderList<I> with ChangeNotifier {
  BaseState state = BaseState<I>();

  dynamic getListData();

  // 下拉刷新
  pullDown() async {
    state.params.page = 0;
    state.requestStatus = 'requesting';
    notifyListeners();
    Response r = await getListData();
    if (r.code == 0 && r.data.list != null) {
      if (r.data.list.length < state.params.limit) {
        state.requestStatus = 'done';
      } else {
        state.requestStatus = 'success';
        state.params.page++;
      }
      state.list = r.data.list;
      notifyListeners();
    } else {
      state.requestStatus = 'error';
      notifyListeners();
    }
  }

  // 上拉加载
  pullUp() async {
    state.requestStatus = 'requesting';
    notifyListeners();
    final r = await getListData();
    if (r.code == 0 && r.data.list != null) {
      if (r.data.list.length < state.params.limit) {
        state.requestStatus = 'done';
      } else {
        state.requestStatus = 'success';
        state.params.page++;
      }
      state.list.addAll(r.data.list);
      notifyListeners();
    } else {
      state.requestStatus = 'error';
      notifyListeners();
    }
  }
}
