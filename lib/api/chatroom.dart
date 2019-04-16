import './index.dart';
import '../model/chatroom.dart';

class ChatRoom extends BaseAxios {
  getArtic(params) async {
    final res = await axios.get('/api/user/chatroom', params);
    return Response.fromJson(res);
  }
}

ChatRoom api = new ChatRoom();
