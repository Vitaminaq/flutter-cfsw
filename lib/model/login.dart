import 'dart:convert';

Response responseFromJson(String str) {
  final jsonData = json.decode(str);
  return Response.fromJson(jsonData);
}

String responseToJson(Response data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Response {
  int code;
  String data;
  String error;

  Response({this.code, this.data, this.error});

  factory Response.fromJson(Map json) => Response(
      code: json["code"] == null ? null : json["code"],
      data: json["data"] == null ? null : json["data"],
      error: json["error"] == null ? null : json["error"]);

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "data": data == null ? null : data,
        "error": code == null ? null : error,
      };
}

class LoginParams {
  String account;
  String type;

  LoginParams({this.account, this.type = '0901'});

  factory LoginParams.fromJson(Map json) => LoginParams(
        account: json["account"] == null ? null : json["account"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "account": account == null ? null : account,
        "type": type == null ? null : type,
      };
}

class RegisterResponse {
  int code;
  RegisterData data;

  RegisterResponse({this.code, this.data});

  factory RegisterResponse.fromJson(Map json) => RegisterResponse(
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null ? null : RegisterData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "data": data == null ? null : data.toJson(),
      };
}

class RegisterData {
  String token;

  RegisterData({this.token});

  factory RegisterData.fromJson(Map json) => RegisterData(
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
      };
}
