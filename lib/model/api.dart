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
