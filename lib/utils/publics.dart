import './storage.dart';

final Function getToken = () async {
  return await Storage.getStringItem('TOKEN');
};

final Function isLogin = () async {
  final r = await Storage.getStringItem('TOKEN');
  return r == null ? false : true;
};
