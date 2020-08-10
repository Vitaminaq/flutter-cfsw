/// 评论或者回复
class CommentResponse {
  int code;
  String data;

  CommentResponse({this.code, this.data});

  factory CommentResponse.fromJson(Map json) =>
      CommentResponse(code: json["code"] == null ? null : json["code"]);

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
      };
}
