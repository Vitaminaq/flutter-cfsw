import './redux-flutter.dart';
import '../model/loader-list.dart' as LoarderListModel;

/**
 * requestStatus = 'unrequest' | 'requesting' | 'success' | 'done' | 'error
 */


abstract class LoaderList extends ReduxFlutter {
  Map<String, dynamic> state = {
    'params': {
      'limit': 9,
      'page': 0
    },
    'list': [],
    'requestStatus': 'unrequest'
  };

  getListData();

  @override
  toObject() {
    return LoarderListModel.State.fromJson(state);
  }

  // 下拉刷新
  pullDown() async {
    state['params']['page'] = 0;
    state['requestStatus'] = 'requesting';
    var r = await getListData();
    if (r.code == 0 && r.data.list != null) {
      if (r.data.list.length < state['params']['limit']) {
        state['requestStatus'] = 'done';
      } else {
        state['requestStatus'] = 'success';
        state['params']['page'] ++;
      }
      state['list'] = r.data.list;
      commit();
    } else {
      state['requestStatus'] = 'error';
      commit();
    }
  }

  // 上拉加载
  pullUp() async {
    state['requestStatus'] = 'requesting';
    final r = await getListData();
    if (r.code == 0 && r.data.list != null) {
      if (r.data.list.length < state['params']['limit']) {
        state['requestStatus'] = 'done';
      } else {
        state['requestStatus'] = 'success';
        state['params']['page'] ++;
      }
      state['list'].addAll(r.data.list);
      commit();
    } else {
      state['requestStatus'] = 'error';
      commit();
    }
  }
}