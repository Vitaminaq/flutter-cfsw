import 'dart:convert';
import './api.dart';

LibraryBookResponse responseFromJson(String str) {
  final jsonData = json.decode(str);
  return LibraryBookResponse.fromJson(jsonData);
}

String responseToJson(LibraryBookResponse data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class LibraryBookParams extends BaseListParams {
  int page;
  int pageSize;

  LibraryBookParams({this.page = 1, this.pageSize = 15});

  Map<String, dynamic> toJson() => {
        "page_size": pageSize == null ? null : pageSize,
        "page": page == null ? null : page,
      };
}

class LibraryBookResponse extends BaseListResponse<Datum, Meta> {
  List<Datum> data;
  Meta meta;
  int code;
  String message;

  LibraryBookResponse({
    this.data,
    this.meta,
    this.code,
    this.message,
  });

  factory LibraryBookResponse.fromJson(Map<String, dynamic> json) =>
      LibraryBookResponse(
          code: json["code"] == null ? null : json["code"],
          data: json["data"] == null
              ? null
              : List.from(json["data"].map((x) => Datum.fromJson(x))),
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
  int id;
  String bookName;
  String author;
  String imgUrl;
  int readCount;
  int readType;
  bool hadTheater;
  int isCollection;
  List<BookGrade> bookGrades;
  List<BookLabel> bookLabels;

  Datum({
    this.id,
    this.bookName,
    this.author,
    this.imgUrl,
    this.readCount,
    this.readType,
    this.hadTheater,
    this.isCollection,
    this.bookGrades,
    this.bookLabels,
  });

  factory Datum.fromJson(Map json) => Datum(
        id: json["id"] == null ? null : json["id"],
        bookName: json["book_name"] == null ? null : json["book_name"],
        author: json["author"] == null ? null : json["author"],
        imgUrl: json["img_url"] == null ? null : json["img_url"],
        readCount: json["read_count"] == null ? null : json["read_count"],
        readType: json["read_type"] == null ? null : json["read_type"],
        hadTheater: json["had_theater"] == null ? null : json["had_theater"],
        isCollection:
            json["is_collection"] == null ? null : json["is_collection"],
        bookGrades: json["book_grades"] == null
            ? null
            : List.from(json["book_grades"].map((x) => BookGrade.fromJson(x))),
        bookLabels: json["book_labels"] == null
            ? null
            : List.from(json["book_labels"].map((x) => BookLabel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "book_name": bookName == null ? null : bookName,
        "author": author == null ? null : author,
        "img_url": imgUrl == null ? null : imgUrl,
        "read_count": readCount == null ? null : readCount,
        "read_type": readType == null ? null : readType,
        "had_theater": hadTheater == null ? null : hadTheater,
        "is_collection": isCollection == null ? null : isCollection,
        "book_grades": bookGrades == null
            ? null
            : List.from(bookGrades.map((x) => x.toJson())),
        "book_labels": bookLabels == null
            ? null
            : List.from(bookLabels.map((x) => x.toJson()))
      };
}

class BookGrade {
  int bookId;
  int gradeId;

  BookGrade({
    this.bookId,
    this.gradeId,
  });

  factory BookGrade.fromJson(Map json) => BookGrade(
      bookId: json["book_id"] == null ? null : json["book_id"],
      gradeId: json["grade_id"] == null ? null : json["grade_id"]);

  Map<String, dynamic> toJson() => {
        "book_id": bookId == null ? null : bookId,
        "grade_id": gradeId == null ? null : gradeId
      };
}

class BookLabel {
  int id;
  String name;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  BookLabel({
    this.id,
    this.name,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory BookLabel.fromJson(Map json) => BookLabel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        deletedAt: json["deleted_at"] == null ? null : json["deleted_at"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "deleted_at": deletedAt == null ? null : deletedAt,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
        "pivot": pivot == null ? null : pivot.toJson()
      };
}

class Pivot {
  int bookId;
  int labelId;
  String createdAt;
  String updatedAt;

  Pivot({
    this.bookId,
    this.labelId,
    this.createdAt,
    this.updatedAt,
  });

  factory Pivot.fromJson(Map json) => Pivot(
        bookId: json["book_id"] == null ? null : json["book_id"],
        labelId: json["label_id"] == null ? null : json["label_id"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "book_id": bookId == null ? null : bookId,
        "label_id": labelId == null ? null : labelId,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt
      };
}
