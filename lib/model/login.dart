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
