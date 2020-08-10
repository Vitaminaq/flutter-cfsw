import './index.dart';
import '../model/chatroom.dart';

class ChatRoom extends BaseAxios {
  Future<FamousResponse> getNoteFamous(params) async {
    final dynamic res = await axios.get('/api/note/famous/options', params);
    print(
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${res['data']}');
    return FamousResponse.fromJson(res);
  }
}

ChatRoom api = ChatRoom();
