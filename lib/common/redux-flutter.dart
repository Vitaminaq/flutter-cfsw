class ReduxFlutter {
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
    Map params = {
      'key': key,
      'callback': callback
    };
    subscribes.add(params);
    callback(toObject());
    print('========== ${key.toString()}订阅并通知成功 ==============');
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
    print('========= 数据变动 ============');
    print(subscribes);
    for (int i = 0; i < subscribes.length; i ++) {
      print('已通知: ' + subscribes[i]['key']);
      subscribes[i]['callback'](toObject());
    }
  }
  // 移除
  void remove() {
    subscribes.clear();
    return;
  }
}