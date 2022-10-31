

import 'package:flutter_mvvm/module/common/user_info/user_info.dart';

abstract class BaseAction {}

class UserAction extends BaseAction {

  late final UserInfo userInfo;

  Future<UserInfo> updateUserInfo() {
    return Future.delayed(Duration(seconds: 3), (){
      return UserInfo(username: 'test', token: '1111111');
    });
  }
}