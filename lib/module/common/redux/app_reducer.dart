import 'package:flutter_mvvm/module/common/redux/app_actions.dart';
import 'package:flutter_mvvm/module/common/redux/app_state.dart';
import 'package:flutter_mvvm/module/common/user_info/user_info.dart';





UserInfo? _updateUserInfo(UserInfo? info, UserAction action) {

  if (action.type == ActionType.updateUserInfo) {
    return action.userInfo;
  }
}

// final userReducer = combineReducers<UserInfo?>([
//   TypedReducer<UserInfo?, UserAction>(_updateUserInfo),
// ]);

const userReducer = _updateUserInfo;

AppState appReducer(AppState state, action) {
  return state.copyWith(userInfo: userReducer(state.userInfo, action));
}