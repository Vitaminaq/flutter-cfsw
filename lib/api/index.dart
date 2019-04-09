import 'dart:convert';
import 'package:dio/dio.dart';

class Axios {
  Dio dio;
  Axios() {
    dio = new Dio(new BaseOptions(
      baseUrl: "http://192.168.0.120:3005",
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
    // 添加请求日志
    dio.interceptors.add(LogInterceptor(responseBody: false));
    // 添加请求拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print('请求拦截器生效');
    }, onResponse: (Response response) {
      print('响应拦截器生效');
      return response.data;
    }, onError: (DioError e) {
      return {'code': 10000, 'error': e};
    }));
    print('dio初始化成功');
  }

  // 错误处理函数
  _error(e) {
    print("请求失败，错误为:" + e.toString());
    final res = {'code': -10000, 'error': e.toString()};
    return JsonToObj.fromJson(res);
  }

  // url: 请求地址 queryParameters： 请求参数
  get(String url, Map<String, dynamic> params) async {
    try {
      final response = await dio.get(url, queryParameters: params);
      return json.decode(response.toString());
    } catch (e) {
      _error(e);
    }
  }

  post(String url, Map<String, dynamic> params) async {
    try {
      return await dio.post(url, data: params);
    } catch (e) {
      _error(e);
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

  Map<String, dynamic> resToJson(res) => {
        res["code"]: res.code == null ? null : res.code,
        res["data"]: res.data == null ? null : res.data,
      };
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
      error: res['error'] == null ? null : res['error']);
  // factory JsonToObj.fromJson(Map<String, dynamic> res) {
  //   if (res == null) {
  //     throw FormatException("解析的值不存在");
  //   }
  //   return JsonToObj(
  //     code: res['code'],
  //     data: res['data'],
  //     error: res['error']
  //   );
  // }
}
