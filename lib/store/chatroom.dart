import '../api/chatroom.dart';
import '../model/chatroom.dart' as ChatRoomModel;
import '../common/loader-list.dart';

class ChatRoomStore extends LoaderList<ChatRoomModel.ListElement> {
  @override
  getListData() async {
    ChatRoomModel.Response r = await api.getArtic(state.params.toJson());
    return r;
  }

  // 更新点赞状态
  updateClickStatus(int id) {
    final list = state.list;
    final len = list.length;
    for (int i = 0; i < len; i++) {
      if (list[i].articId == id) {
        final bool isClick = list[i].isClick == null ? false : list[i].isClick;
        if (isClick) {
          state.list[i].clicknum--;
        } else {
          state.list[i].clicknum++;
        }
        state.list[i].isClick = !list[i].isClick;
      }
    }
    notifyListeners();
  }
}
