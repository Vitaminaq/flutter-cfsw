import './index.dart';
import '../model/chatroom.dart';
import 'package:flutterdemo/model/api.dart';

class ChatRoom extends BaseAxios {
  // 获取精品解析
  Future<FamousResponse> getNoteFamous(params) async {
    return FamousResponse.fromJson(
        await axios.get('/api/note/famous/options', params));
  }

  // 点赞解析
  Future<BaseResponse> likeNote(params) async {
    return BaseResponse.fromJson(
        await axios.post('/api/note/${params['id']}/like'));
  }
}

ChatRoom api = ChatRoom();
