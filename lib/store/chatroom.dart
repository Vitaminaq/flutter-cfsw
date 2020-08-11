import '../api/chatroom.dart';
import '../model/chatroom.dart' as ChatRoomModel;
import '../common/loader-list.dart';

class ChatRoomStore extends LoaderList<ChatRoomModel.FamousResponse,
    ChatRoomModel.Datum, ChatRoomModel.FamousParams> {
  ChatRoomModel.FamousParams params = ChatRoomModel.FamousParams();
  @override
  baseAjaxMethod() async {
    ChatRoomModel.FamousResponse r = await api.getNoteFamous(params.toJson());
    return r;
  }
}

class MustStore extends ChatRoomStore {}

class HotStore extends ChatRoomStore {
  ChatRoomModel.FamousParams params = ChatRoomModel.FamousParams(type: 7);
}
