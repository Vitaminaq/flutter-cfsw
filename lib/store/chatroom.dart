import '../api/chatroom.dart';
import '../model/chatroom.dart' as ChatRoomModel;
import '../common/loader-list.dart';

class ChatRoomStore
    extends LoaderList<ChatRoomModel.FamousResponse, ChatRoomModel.Datum> {
  @override
  baseAjaxMethod() async {
    ChatRoomModel.FamousResponse r = await api.getArtic(params.toJson());
    return r;
  }
}
