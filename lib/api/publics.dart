import './index.dart';
import '../model/publics.dart';

class Publics extends BaseAxios {
  // 用户注册
  Future<UserInfoResponse> getUserInfo() async {
    return UserInfoResponse.fromJson(await axios.get('/api/user/account/info'));
  }
}

Publics api = Publics();
