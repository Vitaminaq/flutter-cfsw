import 'package:flutter/foundation.dart';
import '../model/api.dart';

abstract class LoaderList<R extends BaseListResponse, I,
    P extends BaseListParams> with ChangeNotifier {
  P params;
  List<I> list = [];
  String pullDownStatus = 'unrequest';
  String pullUpStatus = 'unrequest';
  int total = 0;
  R res;

  Future<R> baseAjaxMethod();

  // 合并请求参数
  $assignParams(params) {
    this.params = params;
    return this;
  }

  /// 下拉逻辑
  $pullDownStart() {
    params.page = 1;
    total = 0;
    pullDownStatus = 'pending';
    pullUpStatus = 'pending';
    notifyListeners();
    return;
  }

  $pullDownSuccess(R res) {
    res = res;
    if (res == null || res.code != 1 || res.data == null) {
      pullUpStatus = 'error';
      pullDownStatus = 'success';
      notifyListeners();
      return;
    }
    final List<I> data = res.data;
    final meta = res.meta;
    if (meta != null) {
      final int current_page = meta.pagination.current_page;
      final int total_pages = meta.pagination.total_pages;
      this.total = total;
      if (total == 0) {
        pullUpStatus = 'empty';
      } else if (current_page >= total_pages) {
        pullUpStatus = 'done';
      } else {
        pullUpStatus = 'success';
        params.page++;
      }
    } else {
      final int len = data.length;
      final int page_size = params.page_size;
      if (len == page_size) {
        pullUpStatus = 'success';
        params.page++;
      } else {
        if (len == 0) {
          pullUpStatus = 'empty';
        } else {
          pullUpStatus = 'done';
        }
      }
    }
    pullDownStatus = 'success';
    list = data;
    notifyListeners();
    return;
  }

  Future<R> pullDown() async {
    $pullDownStart();
    final R res = await baseAjaxMethod();
    $pullDownSuccess(res);
    return res;
  }

  /// 上拉逻辑
  $pullUpStart() {
    pullUpStatus = 'pending';
    notifyListeners();
    return;
  }

  $pullUpSuccess(R res) {
    res = res;
    if (res == null || res.code != 1 || res.data == null) {
      pullUpStatus = 'error';
      notifyListeners();
      return;
    }
    final List<I> data = res.data;
    final meta = res.meta;
    if (meta != null) {
      final int current_page = meta.pagination.current_page;
      final int total_pages = meta.pagination.total_pages;
      total = total;
      if (total == 0) {
        pullUpStatus = 'empty';
      } else if (current_page >= total_pages) {
        pullUpStatus = 'done';
      } else {
        pullUpStatus = 'success';
        params.page++;
      }
    } else {
      final int len = data.length;
      final int page = params.page;
      final int page_size = params.page_size;
      if (len == page_size) {
        pullUpStatus = 'success';
        params.page++;
      } else {
        if (page == 1 && len == 0) {
          pullUpStatus = 'empty';
        } else {
          pullUpStatus = 'done';
        }
      }
    }
    list.addAll(data);
    notifyListeners();
    return;
  }

  /// 上拉请求
  pullUp(params) async {
    if (pullUpStatus == 'empty' ||
        pullUpStatus == 'done' ||
        pullUpStatus == 'pending') return;
    print('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
    params && $assignParams(params);
    $pullUpStart();
    final R res = await baseAjaxMethod();
    $pullUpSuccess(res);
    return this;
  }

  /// 清空数据
  $clearData() {
    list = [];
    params.page = 1;
    total = 0;
    pullDownStatus = 'noStart';
    pullUpStatus = 'noStart';
    notifyListeners();
    return;
  }
}
