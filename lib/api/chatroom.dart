import './index.dart';
import '../model/chatroom.dart';

class ChatRoom extends BaseAxios {
  dynamic getArtic(params) async {
    final Map<dynamic, dynamic> res = await axios.get('/api/user/chatroom', params);
    return Response.fromJson(res);
  }
}

ChatRoom api = new ChatRoom();
