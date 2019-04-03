import 'package:dio/dio.dart';

class Axios {
  Dio dio = new Dio();
  // url: 请求地址 queryParameters： 请求参数
  get(String url, Map<String, dynamic> params) async {
    try {
      return await dio.get(url, queryParameters: params);
    } catch (e) {
      print("请求失败，错误为:" + e);
    }
  }
  post(String url, Map<String, dynamic> params) async {
    try {
      return await dio.post(url, data: params);
    } catch (e) {
      print("请求失败，错误为:" + e);
    }
  }
  // 并发
  Future<List<Response>> all(Iterable<Future> list) async {
    return await Future.wait(list);
  }
}