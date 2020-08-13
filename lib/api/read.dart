import './index.dart';
import 'package:flutterdemo/model/read.dart';

class Read extends BaseAxios {
  Future<LibraryBookResponse> getLibraryBook(params) async {
    final dynamic res = await axios.get('/api/user/getLibraryBook', params);
    return LibraryBookResponse.fromJson(res);
  }
}

Read api = Read();
