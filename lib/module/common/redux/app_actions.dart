import 'package:flutter_mvvm/module/common/network/api_request.dart';
import 'package:flutter_mvvm/module/common/network/network_client.dart';
import 'package:flutter_mvvm/module/common/user_info/user_info.dart';
import 'package:flutter_mvvm/module/index/index_api.dart';

abstract class BaseAction {
  final ActionType type;

  BaseAction(this.type);
}

enum ActionType { updateUserInfo }

class UserAction extends BaseAction {
  UserAction(super.type);

  UserInfo? userInfo;

  // Future<UserInfo> updateUserInfo() {
  //   // return Future.delayed(Duration(seconds: 3), (){
  //   //   return UserInfo(username: 'test', token: '1111111');
  //   // });
  //   return IndexAPI.listRequest({})
  //       .mockRequest()
  //       .map((event) => UserInfo(username: '22222', token: 'token'))
  //       .first;
  // }
}
