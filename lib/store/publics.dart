import 'package:flutter/foundation.dart';
import '../utils/storage.dart';

class PublicsStore with ChangeNotifier {
  String token = '';

  bool get isLogin => token == '' ? false : true;

  dynamic getToken() async {
    final String r = await Storage.getStringItem(tokenKey);
    token = r;
    notifyListeners();
  }

  dynamic setToken(String key) async {
    Storage.setStringItem(tokenKey, key);
    token = key;
    notifyListeners();
  }
}
