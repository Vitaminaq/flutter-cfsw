import 'dart:convert';
import './api.dart';

// 列表model
FamousResponse responseFromJson(String str) {
  final jsonData = json.decode(str);
  return FamousResponse.fromJson(jsonData);
}

String responseToJson(FamousResponse data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class FamousParams extends BaseListParams {
  int type = 6;
  int page = 1;
  int page_size = 15;

  FamousParams({this.type = 6, this.page = 1, this.page_size = 15});

  Map<String, dynamic> toJson() => {
        "page_size": page_size == null ? null : page_size,
        "page": page == null ? null : page,
        "type": type == null ? null : type,
      };
}

class FamousResponse extends BaseListResponse<Datum, Meta> {
  List<Datum> data;
  Meta meta;
  int code;
  String message;

  FamousResponse({
    this.data,
    this.meta,
    this.code,
    this.message,
  });

  factory FamousResponse.fromJson(Map<String, dynamic> json) => FamousResponse(
      code: json["code"] == null ? null : json["code"],
      data: json["data"] == null
          ? null
          : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      message: json["message"] == null ? null : json["message"]);

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "data": data == null ? null : List.from(data.map((x) => x.toJson())),
        "meta": meta == null ? null : meta.toJson(),
        "message": code == null ? null : message,
      };
}

class Datum {
  Content content;
  List<SortedContent> sorted_content;
  String type;
  String type_text;
  User user;
  int created_at;
  int id;
  int pv;
  int topic_id;
  String topic_text;
  int like_count;
  bool liked;
  int comment_total_count;
  String title;
  String src_from;
  List<Listen> listen;

  Datum({
    this.content,
    this.sorted_content,
    this.type,
    this.type_text,
    this.user,
    this.created_at,
    this.id,
    this.pv,
    this.topic_id,
    this.topic_text,
    this.like_count,
    this.liked,
    this.comment_total_count,
    this.title,
    this.src_from,
    this.listen,
  });

  factory Datum.fromJson(Map json) => Datum(
        content:
            json["content"] == null ? null : Content.fromJson(json['content']),
        sorted_content: json["sorted_content"] == null
            ? null
            : List<SortedContent>.from(
                json["sorted_content"].map((x) => SortedContent.fromJson(x))),
        type: json["type"] == null ? null : json["type"],
        type_text: json["type_text"] == null ? null : json["type_text"],
        user: json["user"] == null ? null : User.fromJson(json['user']),
        created_at: json["created_at"] == null ? null : json["created_at"],
        id: json["id"] == null ? null : json["id"],
        pv: json["pv"] == null ? null : json["pv"],
        topic_id: json["topic_id"] == null ? null : json["topic_id"],
        topic_text: json["topic_text"] == null ? null : json["topic_text"],
        like_count: json["like_count"] == null ? null : json["like_count"],
        liked: json["liked"] == null ? null : json["liked"],
        comment_total_count: json["comment_total_count"] == null
            ? null
            : json["comment_total_count"],
        title: json["title"] == null ? null : json["title"],
        src_from: json["src_from"] == null ? null : json["src_from"],
        listen: json["listen"] == null
            ? null
            : List<Listen>.from(json["listen"].map((x) => Listen.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? null : content.toJson(),
        "sorted_content": sorted_content == null
            ? null
            : List.from(sorted_content.map((x) => x.toJson())),
        "type": type == null ? null : type,
        "type_text": type_text == null ? null : type_text,
        "user": user == null ? null : user.toJson(),
        "created_at": created_at == null ? null : created_at,
        "id": id == null ? null : id,
        "pv": pv == null ? null : pv,
        "topic_id": topic_id == null ? null : topic_id,
        "topic_text": topic_text == null ? null : topic_text,
        "like_count": like_count == null ? null : like_count,
        "liked": liked == null ? null : liked,
        "comment_total_count":
            comment_total_count == null ? null : comment_total_count,
        "title": title == null ? null : title,
        "src_from": src_from == null ? null : src_from,
        "listen":
            listen == null ? null : List.from(listen.map((x) => x.toJson())),
      };
}

class Content {
  List<Cover> cover;

  Content({
    this.cover,
  });

  factory Content.fromJson(Map json) => Content(
      cover: json["cover"] == null
          ? null
          : List<Cover>.from(json["cover"].map((x) => Cover.fromJson(x))));

  Map<String, dynamic> toJson() {
    final Iterable<Map<String, dynamic>> cs = cover.map((x) => x.toJson());
    final Map<String, dynamic> res = {
      "cover": cover == null ? null : List.from(cs)
    };
    return res;
  }
}

class Cover {
  String type;
  String url;
  String from;
  String sort;
  String viewUrl;

  Cover({
    this.type,
    this.url,
    this.from,
    this.sort,
    this.viewUrl,
  });

  factory Cover.fromJson(Map json) => Cover(
      type: json["type"] == null ? null : json["type"],
      url: json["url"] == null ? null : json["url"],
      from: json["url"] == null ? null : json["url"],
      sort: json["url"] == null ? null : json["url"],
      viewUrl: json["url"] == null ? null : json["url"]);

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "url": url == null ? null : url,
        "from": from == null ? null : from,
        "sort": sort == null ? null : sort,
        "viewUrl": viewUrl == null ? null : viewUrl,
      };
}

class Listen {
  String type;
  bool attached;
  String url;
  String path;
  int size;
  int duration;
  String content;
  int overall;
  int homeId;

  Listen({
    this.type,
    this.attached,
    this.url,
    this.path,
    this.size,
    this.duration,
    this.content,
    this.overall,
    this.homeId,
  });

  factory Listen.fromJson(Map json) => Listen(
      type: json["type"] == null ? null : json["type"],
      url: json["url"] == null ? null : json["url"],
      attached: json["attached"] == null ? null : json["attached"],
      path: json["path"] == null ? null : json["path"],
      size: json["size"] == null ? null : json["size"],
      duration: json["duration"] == null ? null : json["duration"],
      content: json["content"] == null ? null : json["content"],
      overall: json["overall"] == null ? null : json["overall"],
      homeId: json["homeId"] == null ? null : json["homeId"]);

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "url": url == null ? null : url,
        "attached": attached == null ? null : attached,
        "path": path == null ? null : path,
        "size": size == null ? null : size,
        "duration": duration == null ? null : duration,
        "content": content == null ? null : content,
        "overall": overall == null ? null : overall,
        "homeId": homeId == null ? null : homeId,
      };
}

class SortedContent {
  String type;
  bool attached;
  String url;
  int size;
  int duration;
  String text;
  int sort;
  int width;
  int height;

  SortedContent({
    this.type,
    this.attached,
    this.url,
    this.size,
    this.duration,
    this.text,
    this.sort,
    this.width,
    this.height,
  });

  factory SortedContent.fromJson(Map json) => SortedContent(
        type: json["type"] == null ? null : json["type"],
        url: json["url"] == null ? null : json["url"],
        attached: json["attached"] == null ? null : json["attached"],
        text: json["text"] == null ? null : json["text"],
        size: json["size"] == null ? null : json["size"],
        duration: json["duration"] == null ? null : json["duration"],
        sort: json["sort"] == null ? null : json["sort"],
        // width: json["width"] == null ? null : json["width"],
        // height: json["height"] == null ? null : json["height"]
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "url": url == null ? null : url,
        "attached": attached == null ? null : attached,
        "text": text == null ? null : text,
        "size": size == null ? null : size,
        "duration": duration == null ? null : duration,
        "sort": sort == null ? null : sort,
        // "width": width == null ? null : width,
        // "height": height == null ? null : height,
      };
}

class User {
  int id;
  String name;
  String gender;
  String avatar;
  String grade_text;
  String region;
  bool is_expert;

  User({
    this.id,
    this.name,
    this.gender,
    this.avatar,
    this.grade_text,
    this.region,
    this.is_expert,
  });

  factory User.fromJson(Map json) => User(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      gender: json["gender"] == null ? null : json["gender"],
      avatar: json["avatar"] == null ? null : json["avatar"],
      grade_text: json["grade_text"] == null ? null : json["grade_text"],
      region: json["region"] == null ? null : json["region"],
      is_expert: json["is_expert"] == null ? null : json["is_expert"]);

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "gender": gender == null ? null : gender,
        "avatar": avatar == null ? null : avatar,
        "grade_text": grade_text == null ? null : grade_text,
        "region": region == null ? null : region,
        "is_expert": is_expert == null ? null : is_expert
      };
}
