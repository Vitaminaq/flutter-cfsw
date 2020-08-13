///
/// 列表请求相关
///
class BaseListLoadStatus {
  const BaseListLoadStatus(this.status) : assert(status != null);

  final String status;

  static const BaseListLoadStatus noStart = BaseListLoadStatus('noStart');
  static const BaseListLoadStatus pending = BaseListLoadStatus('pending');
  static const BaseListLoadStatus success = BaseListLoadStatus('success');
  static const BaseListLoadStatus error = BaseListLoadStatus('error');
  static const BaseListLoadStatus done = BaseListLoadStatus('done');
  static const BaseListLoadStatus empty = BaseListLoadStatus('empty');
}

class BaseListParams {
  int page_size;
  int page;

  BaseListParams({this.page, this.page_size});

  Map<String, dynamic> toJson() => {
        "page_size": page_size == null ? null : page_size,
        "page": page == null ? null : page,
      };
}

class BaseListResponse<D, M> {
  int code;
  List<D> data;
  M meta;

  BaseListResponse({this.code, this.data, this.meta});
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
  int per_page;
  int current_page;
  int total_pages;
  Links links;

  Pagination({
    this.total,
    this.count,
    this.per_page,
    this.current_page,
    this.total_pages,
    this.links,
  });

  factory Pagination.fromJson(Map json) => Pagination(
      total: json["total"] == null ? null : json["total"],
      count: json["count"] == null ? null : json["count"],
      per_page: json["per_page"] == null ? null : json["per_page"],
      current_page: json["current_page"] == null ? null : json["current_page"],
      total_pages: json["total_pages"] == null ? null : json["total_pages"],
      links: json["links"] == null ? null : Links.fromJson(json["links"]));

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "count": count == null ? null : count,
        "per_page": per_page == null ? null : per_page,
        "current_page": current_page == null ? null : current_page,
        "total_pages": total_pages == null ? null : total_pages,
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

///
/// 基本请求相关
///
class BaseResponse {
  int code;
  String data;

  BaseResponse({this.code, this.data});

  factory BaseResponse.fromJson(Map json) => BaseResponse(
        code: json["code"] == null ? null : json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
      };
}
