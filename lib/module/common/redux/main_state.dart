
import 'package:flutter_mvvm/module/common/redux/main_actions.dart';
import 'package:flutter_mvvm/module/common/user_info/user_info.dart';
import 'package:flutter_mvvm/module/common/user_info/user_info_manager.dart';

class AppState {
  final UserInfo? userInfo;

  AppState({this.userInfo});

  // factory AppState.loading() => AppState();

  AppState copyWith({
    UserInfo? userInfo,
  }) {
    return AppState(userInfo: userInfo);
  }

  @override
  int get hashCode =>
      userInfo.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              userInfo == other.userInfo;

  @override
  String toString() {
    return 'AppState{ userInfo: $userInfo }';
  }
}