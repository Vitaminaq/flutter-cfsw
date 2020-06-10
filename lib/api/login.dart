import './index.dart';
import '../model/login.dart';

class Login extends BaseAxios {
  dynamic onekeyLogin(params) async {
    final Map<dynamic, dynamic> res =
        await axios.post('/api/user/login/onekey', params);
    return Response.fromJson(res);
  }
}

Login api = Login();
