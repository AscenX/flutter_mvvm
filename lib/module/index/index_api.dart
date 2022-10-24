import 'package:flutter_mvvm/module/common/network/base_api.dart';
import 'package:flutter_mvvm/module/index/index_data.dart';

class IndexAPI extends BaseAPI {
  IndexAPI(
      {required super.path,
      required super.method,
      super.params,
      super.headers,
      super.type});

  static IndexAPI getRequest() {
    return IndexAPI(path: 'get', method: HttpMethod.get);
  }

  static IndexAPI postRequest() {
    return IndexAPI(path: 'post', method: HttpMethod.post);
  }
  
  static IndexAPI listRequest(int page) {

    return IndexAPI(path: 'list', method: HttpMethod.get);
  }
}
