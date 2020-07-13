import './index.dart';
import '../model/chatroom.dart';

class ChatRoom extends BaseAxios {
  Future<Response> getArtic(params) async {
    final Map<dynamic, dynamic> res =
        await axios.get('/api/user/chatroom', params);
    return Response.fromJson(res);
  }

  Future<ClickResponse> clickIt(params) async {
    final Map<dynamic, dynamic> res =
        await axios.post('/api/user/agree/artic', params);
    return ClickResponse.fromJson(res);
  }
}

ChatRoom api = ChatRoom();
