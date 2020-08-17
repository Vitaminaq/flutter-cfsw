import 'package:dio/dio.dart';
import '../config.dart' as config;
import '../utils/publics.dart';
import 'package:flutterdemo/component/popup/toast.dart';
import 'package:flutterdemo/store/publics.dart';

// 普通基本请求
class Axios {
  Dio dio;
  Axios() {
    dio = Dio(BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 100000,
      // 5s
      headers: {
        'Content-Type': 'application/json',
        'Cache-Control': 'no-cache',
      },
    ));
    init();
  }

  init() {
    // // 添加请求日志
    dio.interceptors.add(LogInterceptor(responseBody: false));
    // 添加请求拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      final String token = await getToken();
      options.headers['Authorization'] = 'Bearer $token';
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
  dynamic allResponse(dynamic res) {
    final r = JsonToObj.fromJson(res);
    if (r.code != 1 && PublicsStore.globalContext != null) {
      final String message = r.message == null ? '请求失败' : r.message;
      toast(PublicsStore.globalContext, message);
    }
    return r.toJson();
  }

  // 错误处理函数, 捕获在dio的错误拦截器之后,所以其实都不用捕获了
  dynamic _error(dynamic e) {
    print("请求失败，错误为:" + e.toString());
    final Map<String, dynamic> res = {'code': -10000, 'data': null};
    return res;
  }

  // get  url: 请求地址 queryParameters： 请求参数
  Future<dynamic> get(String url, [Map<String, dynamic> params]) async {
    try {
      Response response = await dio.get(url, queryParameters: params);
      return allResponse(response.data);
    } catch (e) {
      return _error(e);
    }
  }

  // post
  Future<dynamic> post(String url, [Map<String, dynamic> params]) async {
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

final Axios baseAxios = Axios();

// 请求基类
class BaseAxios {
  Axios axios;
  BaseAxios() {
    axios = baseAxios;
  }
}

// json映射 把响应数据第一层转化为对象,做错误
// 的统一处理，后再还原
class JsonToObj {
  JsonToObj({this.code, this.data, this.message});
  int code;
  dynamic data;
  String message;

  factory JsonToObj.fromJson(Map<String, dynamic> res) => JsonToObj(
      code: res["code"] == null ? null : res["code"],
      data: res["data"] == null ? null : res["data"],
      message: res['message'] == null ? null : res['message']);

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "data": data == null ? null : data,
        "message": message == null ? null : message,
      };
}

// 上传七牛云服务
class UploadAxios {
  Dio uploadDio;
  UploadAxios() {
    uploadDio = Dio(BaseOptions(
      baseUrl: 'https://up-z2.qiniup.com',
      connectTimeout: 5000000,
      receiveTimeout: 10000000,
    ));
  }

  // post
  dynamic post(String url, [dynamic params]) async {
    try {
      Response response = await uploadDio.post(url, data: params);
      return response.data;
    } catch (e) {
      return;
    }
  }

  // 并发
  Future<List<dynamic>> all(Iterable<Future> list) async {
    return await Future.wait(list);
  }
}

final UploadAxios uploadAxios = UploadAxios();
