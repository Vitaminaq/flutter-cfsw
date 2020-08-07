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

  factory FamousResponse.fromJson(Map json) => FamousResponse(
      code: json["code"] == null ? null : json["code"],
      data: json["data"] == null
          ? null
          : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      message: json["message"] == null ? null : json["message"]);

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "data":
            data == null ? null : List<Datum>.from(data.map((x) => x.toJson())),
        "meta": meta == null ? null : meta.toJson(),
        "message": code == null ? null : message,
      };
}

class Datum {
  Content content;
  List<SortedContent> sortedContent;
  String type;
  String typeText;
  User user;
  int createdAt;
  int id;
  int pv;
  int topicId;
  String topicText;
  int likeCount;
  bool liked;
  int commentTotalCount;
  String title;
  String srcFrom;
  List<Listen> listen;

  Datum({
    this.content,
    this.sortedContent,
    this.type,
    this.typeText,
    this.user,
    this.createdAt,
    this.id,
    this.pv,
    this.topicId,
    this.topicText,
    this.likeCount,
    this.liked,
    this.commentTotalCount,
    this.title,
    this.srcFrom,
    this.listen,
  });

  factory Datum.fromJson(Map json) => Datum(
        content:
            json["content"] == null ? null : Content.fromJson(json['content']),
        sortedContent: json["sortedContent"] == null
            ? null
            : List<SortedContent>.from(
                json["sortedContent"].map((x) => SortedContent.fromJson(x))),
        type: json["type"] == null ? null : json["type"],
        typeText: json["typeText"] == null ? null : json["typeText"],
        user: json["user"] == null ? null : User.fromJson(json['user']),
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        id: json["id"] == null ? null : json["id"],
        pv: json["pv"] == null ? null : json["pv"],
        topicId: json["topicId"] == null ? null : json["topicId"],
        topicText: json["topicText"] == null ? null : json["topicText"],
        likeCount: json["likeCount"] == null ? null : json["likeCount"],
        liked: json["liked"] == null ? null : json["liked"],
        commentTotalCount: json["commentTotalCount"] == null
            ? null
            : json["commentTotalCount"],
        title: json["title"] == null ? null : json["title"],
        srcFrom: json["srcFrom"] == null ? null : json["srcFrom"],
        listen: json["listen"] == null
            ? null
            : List<Listen>.from(
                json["sortedContent"].map((x) => Listen.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? null : content.toJson(),
        "sortedContent": sortedContent == null
            ? null
            : List<SortedContent>.from(sortedContent.map((x) => x.toJson())),
        "type": type == null ? null : type,
        "typeText": typeText == null ? null : typeText,
        "user": user == null ? null : user.toJson(),
        "createdAt": createdAt == null ? null : createdAt,
        "id": id == null ? null : id,
        "pv": pv == null ? null : pv,
        "topicId": topicId == null ? null : topicId,
        "topicText": topicText == null ? null : topicText,
        "likeCount": likeCount == null ? null : likeCount,
        "liked": liked == null ? null : liked,
        "commentTotalCount":
            commentTotalCount == null ? null : commentTotalCount,
        "title": title == null ? null : title,
        "srcFrom": title == null ? null : srcFrom,
        "listen": listen == null
            ? null
            : List<Listen>.from(listen.map((x) => x.toJson())),
      };
}

class Content {
  List<Cover> cover;

  Content({
    this.cover,
  });

  factory Content.fromJson(Map json) => Content(
      cover: json["data"] == null
          ? null
          : List<Cover>.from(json["data"].map((x) => Cover.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "cover": cover == null
            ? null
            : List<Cover>.from(cover.map((x) => x.toJson()))
      };
}

class Cover {
  String type;
  String url;
  String from;
  int sort;
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
      width: json["width"] == null ? null : json["width"],
      height: json["height"] == null ? null : json["height"]);

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "url": url == null ? null : url,
        "attached": attached == null ? null : attached,
        "text": text == null ? null : text,
        "size": size == null ? null : size,
        "duration": duration == null ? null : duration,
        "sort": sort == null ? null : sort,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
      };
}

class User {
  int id;
  String name;
  String gender;
  String avatar;
  String gradeText;
  String region;
  bool isExpert;

  User({
    this.id,
    this.name,
    this.gender,
    this.avatar,
    this.gradeText,
    this.region,
    this.isExpert,
  });

  factory User.fromJson(Map json) => User(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"],
      gender: json["gender"] == null ? null : json["gender"],
      avatar: json["avatar"] == null ? null : json["avatar"],
      gradeText: json["gradeText"] == null ? null : json["gradeText"],
      region: json["region"] == null ? null : json["region"],
      isExpert: json["isExpert"] == null ? null : json["isExpert"]);

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "gender": gender == null ? null : gender,
        "avatar": avatar == null ? null : avatar,
        "gradeText": gradeText == null ? null : gradeText,
        "region": region == null ? null : region,
        "isExpert": isExpert == null ? null : isExpert
      };
}

class Meta {
  Pagination pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromJson(Map json) => Meta(
      pagination: json["pagination"] == null
          ? null
          : Pagination.fromJson(json["pagination"]));

  Map<String, dynamic> toJson() =>
      {"pagination": pagination == null ? null : pagination.toJson()};
}

class Pagination {
  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;
  Links links;

  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  factory Pagination.fromJson(Map json) => Pagination(
      total: json["total"] == null ? null : json["total"],
      count: json["count"] == null ? null : json["count"],
      perPage: json["perPage"] == null ? null : json["perPage"],
      currentPage: json["currentPage"] == null ? null : json["currentPage"],
      totalPages: json["totalPages"] == null ? null : json["totalPages"],
      links: json["links"] == null ? null : Links.fromJson(json["links"]));

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "count": count == null ? null : count,
        "perPage": perPage == null ? null : perPage,
        "currentPage": currentPage == null ? null : currentPage,
        "totalPages": totalPages == null ? null : totalPages,
        "links": links == null ? null : links.toJson()
      };
}

class Links {
  String next;

  Links({
    this.next,
  });

  factory Links.fromJson(Map json) =>
      Links(next: json["next"] == null ? null : json["next"]);

  Map<String, dynamic> toJson() => {"next": next == null ? null : next};
}
