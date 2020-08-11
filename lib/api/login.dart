import './index.dart';
import '../model/login.dart';
import '../model/api.dart';

class Login extends BaseAxios {
  // 发送验证码
  Future<BaseResponse> getcode(params) async {
    return BaseResponse.fromJson(await axios.post('/api/code/send', params));
  }

  // 用户注册
  Future<RegisterResponse> register(params) async {
    return RegisterResponse.fromJson(await axios.post('/api/register', params));
  }
}

Login api = Login();
