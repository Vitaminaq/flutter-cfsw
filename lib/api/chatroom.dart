import './index.dart';

class ChatRoom extends BaseAxios {
  getArtic(params) {
    final res = axios.get('/api/user/chatroom', params);
    return res;
  }
}

ChatRoom api = new ChatRoom();
