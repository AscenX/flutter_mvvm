
import 'package:flutter/foundation.dart';

abstract class BaseViewModel {

  /// 分页用，默认第1页
  int page = 1;
  /// 数据源
  List dataSource = [];

  BaseViewModel() {
    init();
  }

  void init() {
      if (kDebugMode) {
        print('$this has been initialized');
      }
  }
}