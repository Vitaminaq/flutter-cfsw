import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/publics.dart';
import '../component/button/button-max.dart';
import '../api/login.dart';
import 'package:flutterdemo/router/index.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  String _phone;
  String _code;

  // 聚焦
  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();

    /// WidgetsBinding 它能监听到第一帧绘制完成，第一帧绘制完成标志着已经Build完成
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ///获取输入框焦点
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.phone,
                // 会存在页面还未渲染完，就聚焦的警告
                // autofocus: true,
                focusNode: focusNode,
                controller: _unameController,
                decoration: InputDecoration(
                    hintText: "请输入您的手机号", prefixIcon: Icon(Icons.person)),
                // 校验用户名
                validator: (v) {
                  final len = v.trim().length;
                  if (len < 11 || len > 11) return '请输入正确的手机号';
                  return null;
                },
                onSaved: (val) {
                  _phone = val;
                },
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _pwdController,
                  decoration: InputDecoration(
                      hintText: "请输入验证码", prefixIcon: Icon(Icons.lock)),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    final len = v.trim().length;
                    if (len < 6 || len > 6) return '请输入6位验证码';
                    return null;
                  },
                  onSaved: (val) {
                    _code = val;
                  }),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Consumer<PublicsStore>(
                            builder: (context, publicsStore, child) => Builder(
                                  builder: (context) {
                                    return ButtonMax(
                                      btnText: '登录',
                                      callback: () async {
                                        FormState _form = _formKey.currentState;

                                        if ((_form).validate()) {
                                          //验证通过提交数据
                                          print('校验通过');
                                          _form.save();
                                          print(_phone);
                                          dynamic r = await api.onekeyLogin(
                                              {'phone': _phone, 'code': _code});
                                          if (r.code != 0) {
                                            return;
                                          }
                                          Provider.of<PublicsStore>(context,
                                                  listen: false)
                                              .setToken(r.data);
                                          router.back(context, 1);
                                        }
                                      },
                                    );
                                  },
                                ))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
