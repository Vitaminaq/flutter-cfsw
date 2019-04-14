import '../api/chatroom.dart';
import '../model/chatroom.dart' as ChatRoomModel;
import '../common/loader-list.dart';

class ChatRoomStore extends LoaderList {
  @override
  toObject() {
    return ChatRoomModel.State.fromJson(state);
  }

  @override
  getListData() async {
    ChatRoomModel.Response r = await api.getArtic(state['params']);
    return r;
  }
}
