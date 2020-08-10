import './index.dart';
import 'package:flutterdemo/model/webview.dart';

class Webview extends BaseAxios {
  Future<CommentResponse> commentOrReply(params) async {
    final dynamic res =
        await axios.post('/api/note/${params['note_id']}/comment', params);
    return CommentResponse.fromJson(res);
  }
}

Webview api = Webview();
