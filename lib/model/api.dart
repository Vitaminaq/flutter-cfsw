class BaseListParams {
  int page_size = 9;
  int page = 0;

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
