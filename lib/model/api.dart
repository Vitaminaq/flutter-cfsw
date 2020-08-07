class BaseListResponse<D, M> {
  int code;
  List<D> data;
  M meta;

  BaseListResponse({this.code, this.data, this.meta});
}
