import 'dart:convert';

BaseResponse responseFromJson(String str) {
  final jsonData = json.decode(str);
  return BaseResponse.fromJson(jsonData);
}

String responseToJson(BaseResponse data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class BaseResponse {
  int code;
  String data;
  String error;

  BaseResponse({this.code, this.data, this.error});

  factory BaseResponse.fromJson(Map json) => BaseResponse(
      code: json["code"] == null ? null : json["code"],
      data: json["data"] == null ? null : json["data"],
      error: json["error"] == null ? null : json["error"]);

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "data": data == null ? null : data,
        "error": code == null ? null : error,
      };
}
