import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/module/common/redux/app_state.dart';
import 'package:flutter_mvvm/module/common/redux/app_store.dart';
import 'package:flutter_mvvm/module/common/user_info/user_info.dart';
import 'package:flutter_mvvm/module/common/user_info/user_info_manager.dart';

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Widget columns = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 44,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: Colors.grey)),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text('请输入帐号'),
              Expanded(
                  child: CupertinoTextField(
                keyboardType: TextInputType.emailAddress,
                placeholder: '请输入帐号',
                textInputAction: TextInputAction.next,
                decoration: BoxDecoration(border: null),
                style: TextStyle(fontSize: 14),
              ))
            ],
          ),
        ),
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: '请输入密码',
          ),
          textInputAction: TextInputAction.done,
          obscureText: true,
        ),
        SizedBox(height: 20),
        OutlinedButton(
            onPressed: () {
              UserInfo userInfo = UserInfo.fromJson({'username' : 'test', 'token' : DateTime.now().toString()});
              UserInfoManager.shared.userInfo = userInfo;
              Store.shared.updateState(AppState(userInfo: userInfo));
            },
            child: Text(
              '登录',
              style: TextStyle(color: Colors.black),
            )),
      ],
    );

    return Scaffold(
      // resizeToAvoidBottomInset: false,

      appBar: const CupertinoNavigationBar(
        middle: Text('Login'),
        leading: CloseButton(color: Colors.black),
        border: null,
        backgroundColor: Colors.white,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          padding: EdgeInsets.only(left: 16, right: 16, top: 50),
          child: SingleChildScrollView(
            child: columns,
          )),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}
