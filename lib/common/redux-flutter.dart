class ReduxFlutter {
  final String name = 'ReduxFlutter';

  Map<String, dynamic> state;
  List<Map> subscribes = [];

  toObject() {
    return state;
  }

  // 订阅状态管理
  void subscribe(String key, Function callback) {
    for (int i = 0; i < subscribes.length; i++) {
      if (subscribes[i]['key'] == key) return;
    }
    Map<String, dynamic> params = {'key': key, 'callback': callback};
    subscribes.add(params);
    print('========== ${key.toString()}订阅${name.toString()}成功 ==============');
    callback(toObject());
    print('========== ${name.toString()}通知${key.toString()}成功 ==============');
    return;
  }

  // 取消订阅
  void unSubscribe(String key) {
    for (int i = 0; i < subscribes.length; i++) {
      if (subscribes[i]['key'] == key) {
        subscribes.removeAt(i);
      }
    }
    return;
  }

  // 广播
  void commit() {
    print('========= ${name.toString()} 数据变动 ============');
    for (int i = 0; i < subscribes.length; i++) {
      print('已通知: ' + subscribes[i]['key']);
      subscribes[i]['callback'](toObject());
    }
    print('========== 通知完毕 ==============');
  }

  // 移除
  void remove() {
    subscribes.clear();
    return;
  }
}
