import 'package:flutter_mvvm/module/common/redux/main_actions.dart';
import 'package:flutter_mvvm/module/common/redux/main_state.dart';
import 'package:flutter_mvvm/module/common/user_info/user_info.dart';
import 'package:redux/redux.dart';





UserInfo _updateUserInfo(UserInfo? info, UserAction action) {
  return action.userInfo;
}

final userReducer = combineReducers<UserInfo?>([
  TypedReducer<UserInfo?, UserAction>(_updateUserInfo),
]);

AppState appReducer(AppState state, action) {
  return AppState(
    userInfo: userReducer(state.userInfo, action));
}