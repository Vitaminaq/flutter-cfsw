class RequestParams {
  int limit;
  int page;

  RequestParams({this.limit, this.page });

  factory RequestParams.fromJson(Map<String, dynamic> json) => new RequestParams(
      limit: json["limit"] == null ? null : json["limit"],
      page: json["page"] == null ? null : json["page"],
  );
}
class State {
  RequestParams params;
  List list;
  String requestStatus;

  State({this.params, this.list, this.requestStatus});

  factory State.fromJson(Map<String, dynamic> json) => new State(
      list: json["list"] == null ? null : [],
      params: json["params"] == null ? null : RequestParams.fromJson(json['params']),
      requestStatus: json["requestStatus"] == null ? null : json["requestStatus"],
  );
}