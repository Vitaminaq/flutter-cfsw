import '../api/chatroom.dart';
import '../model/chatroom.dart' as ChatRoomModel;
import '../common/loader-list.dart';

class ChatRoomStore extends LoaderList<ChatRoomModel.FamousResponse,
    ChatRoomModel.Datum, ChatRoomModel.FamousParams> {
  // @override
  // // TODO: implement params
  // ChatRoomModel.FamousParams get params => super.params;
  ChatRoomModel.FamousParams params = ChatRoomModel.FamousParams();

  @override
  baseAjaxMethod() async {
    ChatRoomModel.FamousResponse r = await api.getNoteFamous(params.toJson());
    print('wwwwwwwwwwwwwwwwwwwwwwwwwwww ${r.toJson().toString()}');
    return r;
  }
}
