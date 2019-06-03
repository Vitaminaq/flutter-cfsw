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
    Data data;
    String error;

    Response({
        this.code,
        this.data,
        this.error
    });

    factory Response.fromJson(Map json) => Response(
        code: json["code"] == null ? null : json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        error: json["error"] == null ? null : json["error"]
    );

    Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "data": data == null ? null : data.toJson(),
        "error": code == null ? null : error,
    };
}

class Data {
    List list;
    int pageIndex;
    int pageSize;
    int total;

    Data({
        this.list,
        this.pageIndex,
        this.pageSize,
        this.total,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"],
        pageIndex: json["pageIndex"] == null ? null : json["pageIndex"],
        pageSize: json["pageSize"] == null ? null : json["pageSize"],
        total: json["total"] == null ? null : json["total"],
    );

    Map<String, dynamic> toJson() => {
        "list": list == null ? null : List<dynamic>.from(list.map((x) => x.toJson())),
        "pageIndex": pageIndex == null ? null : pageIndex,
        "pageSize": pageSize == null ? null : pageSize,
        "total": total == null ? null : total,
    };
}

class RequestParams {
  int limit;
  int page;

  RequestParams({this.limit, this.page });

  factory RequestParams.fromJson(Map<String, dynamic> json) => RequestParams(
      limit: json["limit"] == null ? null : json["limit"],
      page: json["page"] == null ? null : json["page"],
  );
}
class State {
  RequestParams params;
  List<ListElement> list;
  String requestStatus;

  State({this.params, this.list, this.requestStatus});

  factory State.fromJson(Map<String, dynamic> json) => State(
      params: json["params"] == null ? null : RequestParams.fromJson(json['params']),
      list: json["list"] == null ? null :
        List<ListElement>.from(
          json["list"].map(
            (x) => ListElement.fromJson(x)
          )
      ),
      requestStatus: json["requestStatus"] == null ? null : json["requestStatus"],
  );
}

class ListElement {
    int articId;
    int uid;
    String title;
    String msg;
    int viewnum;
    int clicknum;
    int commentnum;
    String creatAt;
    dynamic updateAt;
    String headimg;

    ListElement({
        this.articId,
        this.uid,
        this.title,
        this.msg,
        this.viewnum,
        this.clicknum,
        this.commentnum,
        this.creatAt,
        this.updateAt,
        this.headimg,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        articId: json["articId"] == null ? null : json["articId"],
        uid: json["uid"] == null ? null : json["uid"],
        title: json["title"] == null ? null : json["title"],
        msg: json["msg"] == null ? null : json["msg"],
        viewnum: json["viewnum"] == null ? null : json["viewnum"],
        clicknum: json["clicknum"] == null ? null : json["clicknum"],
        commentnum: json["commentnum"] == null ? null : json["commentnum"],
        creatAt: json["creatAt"] == null ? null : json["creatAt"],
        updateAt: json["updateAt"],
        headimg: json["headimg"] == null ? null : json["headimg"],
    );

    Map<String, dynamic> toJson() => {
        "articId": articId == null ? null : articId,
        "uid": uid == null ? null : uid,
        "title": title == null ? null : title,
        "msg": msg == null ? null : msg,
        "viewnum": viewnum == null ? null : viewnum,
        "clicknum": clicknum == null ? null : clicknum,
        "commentnum": commentnum == null ? null : commentnum,
        "creatAt": creatAt == null ? null : creatAt,
        "updateAt": updateAt,
        "headimg": headimg == null ? null : headimg,
    };
}