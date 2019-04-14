import 'dart:convert';
import 'package:dio/dio.dart';
import '../config.dart' as config;

class Axios {
  Dio dio;
  Axios() {
    dio = new Dio(new BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 100000,
      // 5s
      headers: {
        'Content-Type': 'application/json',
        'Cache-Control': 'no-cache'
      },
    ));
    init();
  }

  init() {
    // // 添加请求日志
    // dio.interceptors.add(LogInterceptor(responseBody: false));
    // 添加请求拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print('请求拦截器生效');
    }, onResponse: (Response response) {
      print('响应拦截器生效');
      return response;
    }, onError: (DioError e) {
      return {'code': 10000, 'error': e};
    }));
    print('dio初始化成功');
  }

  // 统一返回格式
  allResponse(String res) {
    final r = JsonToObj.fromJson(json.decode(res.toString()));
    if (r == null || r.data == null) 
      return {
        'code': -10001,
        'data': '返回数据格式错误',
        'error': '返回数据格式错误'
      };
    return json.decode(res.toString());
  }

  // 错误处理函数
  _error(e) {
    print("请求失败，错误为:" + e.toString());
    final res = {'code': -10000, 'error': e.toString()};
    return JsonToObj.fromJson(res);
  }

  // get  url: 请求地址 queryParameters： 请求参数
  dynamic get(String url, Map<String, dynamic> params) async {
    try {
      Response response = await dio.get(url, queryParameters: params);
      return allResponse(response.data);
    } catch (e) {
      return _error(e);
    }
  }

  // post
  dynamic post(String url, Map<String, dynamic> params) async {
    try {
      Response response = await dio.post(url, data: params);
      return allResponse(response.data);
    } catch (e) {
      return _error(e);
    }
  }

  // 并发
  Future<List<Response>> all(Iterable<Future> list) async {
    return await Future.wait(list);
  }
}

// 请求基类
class BaseAxios {
  Axios axios;
  BaseAxios() {
    axios = Axios();
  }
}

// json映射
class JsonToObj {
  JsonToObj({this.code, this.data, this.error});
  int code;
  dynamic data;
  String error;

  factory JsonToObj.fromJson(Map<String, dynamic> res) => JsonToObj(
      code: res["code"] == null ? null : res["code"],
      data: res["data"] == null ? null : res["data"],
      error: res['error'] == null ? null : res['error']
  );
}
