

abstract class BaseViewModel {

  /// 分页用，默认第1页
  int page = 1;
  List dataSource = [];

  BaseViewModel() {
    init();
  }

  void init() {
      print('$this has been initialized');
  }
}