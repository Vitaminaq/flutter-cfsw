import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import '../store/publics.dart';
import '../component/button/button-max.dart';
import '../api/login.dart';
import 'package:flutterdemo/router/index.dart';
import 'package:flutterdemo/utils/filter.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  String phone = '';
  String code = '';
  bool isRealPhone = false;
  bool isRealCode = false;
  int second;

  /// 倒计时的计时器。
  Timer timer;
  String getCodeText = '获取验证码';
  bool isGeting = false;

  // 聚焦
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    second = 60;
    isRealPhone = false;
    isRealCode = false;
    getCodeText = '获取验证码';
    isGeting = false;

    /// WidgetsBinding 它能监听到第一帧绘制完成，第一帧绘制完成标志着已经Build完成
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ///获取输入框焦点
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  // 获取验证码的按钮是否可点击
  bool get codeBtnDisable =>
      isGeting == false && isRealPhone == true ? false : true;
  // 提交按钮是否可点击
  bool get submitBtnDisable =>
      isRealPhone == true && isRealCode == true ? false : true;

  countDown() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      second--;
      getCodeText = '${second}s';
      isGeting = true;
      if (second == 0) {
        getCodeText = '获取验证码';
        isGeting = false;
        timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: <Widget>[
            Container(
              child: TextFormField(
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  // 会存在页面还未渲染完，就聚焦的警告
                  // autofocus: true,
                  focusNode: focusNode,
                  controller: _unameController,
                  decoration: InputDecoration(
                    hintText: "请输入您的手机号",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xff00c295),
                    ),
                  ),
                  onChanged: (v) {
                    if (v == null || v.length < 10) return;
                    setState(() {
                      isRealPhone = isPhone(v.toString());
                      phone = v;
                    });
                  }),
            ),
            Stack(children: [
              Row(children: [
                Expanded(
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      controller: _pwdController,
                      decoration: InputDecoration(
                          hintText: "请输入验证码",
                          prefixIcon:
                              Icon(Icons.lock, color: Color(0xff00c295))),
                      obscureText: true,
                      onChanged: (v) {
                        if (v == null || v.length < 5) return;
                        setState(() {
                          code = v;
                          isRealCode = v.length == 6 ? true : false;
                        });
                      }),
                )
              ]),
              Positioned(
                  bottom: 36.0,
                  right: 32.0,
                  child: GestureDetector(
                    child: Text(
                      '$getCodeText',
                      style: TextStyle(
                          color: codeBtnDisable == false
                              ? Color(0xff00c295)
                              : Color(0xFFbcbcbc)),
                    ),
                    onTap: () async {
                      if (codeBtnDisable == true) return;
                      final r =
                          await api.getcode({'account': phone, 'type': '0901'});
                      if (r.code != 1) return;
                      countDown();
                    },
                  ))
            ]),
            // 登录按钮
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Consumer<PublicsStore>(
                          builder: (context, publicsStore, child) => Builder(
                                builder: (context) {
                                  return ButtonLogin(
                                    disable: submitBtnDisable,
                                    btnText: '登录',
                                    callback: () async {
                                      final r = await api.register(
                                          {'account': phone, 'code': code});
                                      if (r.code != 1 ||
                                          r.data == null ||
                                          r.data.token == null) return;
                                      await publicsStore.setToken(r.data.token);
                                      publicsStore.getUserInfo();
                                      router.back(context, 1);
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
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (timer == null) return;
    timer.cancel();
  }
}
