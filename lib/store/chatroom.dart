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

  // 更新点赞状态
  updateClickStatus(int id) {
    final len = list.length;
    for (int i = 0; i < len; i++) {
      if (list[i].id == id) {
        final bool liked = list[i].liked == null ? false : list[i].liked;
        if (liked) {
          list[i].like_count--;
        } else {
          list[i].like_count++;
        }
        list[i].liked = !list[i].liked;
      }
    }
    notifyListeners();
  }

  // 更新评论总数
  updateCommentCount(int id) {
    final len = list.length;
    for (int i = 0; i < len; i++) {
      if (list[i].id == id) {
        list[i].comment_total_count = 1;
      }
    }
    notifyListeners();
  }
}

class MustStore extends ChatRoomStore {}

class HotStore extends ChatRoomStore {
  ChatRoomModel.FamousParams params = ChatRoomModel.FamousParams(type: 7);
}
