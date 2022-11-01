import 'dart:convert';

import 'package:flutter_mvvm/module/common/user_info/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoManager {
  final prefs = SharedPreferences.getInstance();

  //私有构造函数
  UserInfoManager._internal() {
    prefs.then((value) {
      String? userInfoStr = value.getString('userInfo');
      if (userInfoStr != null) {
        print('99999999999 $userInfoStr');
        _userInfo = UserInfo.fromJson(json.decode(userInfoStr!));
      }
    });
  }

  //保存单例
  static final UserInfoManager shared = UserInfoManager._internal();

  late UserInfo? _userInfo;

  UserInfo? get userInfo => _userInfo;

  set userInfo(UserInfo? info) {
    // 持久化
    _userInfo = info;
    String userInfoStr = json.encode(info);
    prefs.then((value) async {
      if (info != null) {
        await value.setString('userInfo', userInfoStr);
      } else {
        await value.setString('userInfo', '');
      }
    });
  }
}
