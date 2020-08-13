class LibraryBookResponse {
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
}

class BookGrade {
  int bookId;
  int gradeId;

  BookGrade({
    this.bookId,
    this.gradeId,
  });
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
}

class Meta {
  Pagination pagination;

  Meta({
    this.pagination,
  });
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
}

class Links {
  String next;

  Links({
    this.next,
  });
}
