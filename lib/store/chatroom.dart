import '../api/chatroom.dart';
import '../model/chatroom.dart' as ChatRoomModel;
import '../common/loader-list.dart';

class ChatRoomStore extends LoaderList<ChatRoomModel.ListElement> {
  @override
  getListData() async {
    ChatRoomModel.Response r = await api.getArtic(state.params.toJson());
    return r;
  }
}
