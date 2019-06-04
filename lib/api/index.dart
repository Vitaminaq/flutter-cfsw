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
    dio.interceptors.add(LogInterceptor(responseBody: false));
    // 添加请求拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print('请求拦截器生效');
    }, onResponse: (Response response) {
      print('响应拦截器生效');
      return response;
    }, onError: (DioError e) {
      print('错误拦截器生效');
      return e;
    }));
    print('dio初始化成功');
  }

  // 统一返回格式
  dynamic allResponse(String res) {
    final r = JsonToObj.fromJson(json.decode(res.toString()));
    if (r == null || r.data == null)
      return {'code': -10001, 'data': null, 'error': '返回数据格式错误'};
    return json.decode(res.toString());
  }

  // 错误处理函数, 捕获在dio的错误拦截器之后,所以其实都不用捕获了
  dynamic _error(dynamic e) {
    print("请求失败，错误为:" + e.toString());
    final Map<String, dynamic> res = {
      'code': -10000,
      'data': null,
      'error': e.toString()
    };
    return res;
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

/**
 * json映射 把响应数据第一层转化为对象,做错误
 * 的统一处理，后再还原
 */
class JsonToObj {
  JsonToObj({this.code, this.data, this.error});
  int code;
  dynamic data;
  String error;

  factory JsonToObj.fromJson(Map<String, dynamic> res) => JsonToObj(
      code: res["code"] == null ? null : res["code"],
      data: res["data"] == null ? null : res["data"],
      error: res['error'] == null ? null : res['error']);

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "data": data == null ? null : data,
        "error": error == null ? null : error,
      };
}
