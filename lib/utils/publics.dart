import './storage.dart';

final Function getToken = () async {
  final String token = await Storage.getStringItem('TOKEN');
  return token == null ? '' : token;
};

final Function isLogin = () async {
  final r = await Storage.getStringItem('TOKEN');
  return r == null ? false : true;
};
