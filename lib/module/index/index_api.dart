import 'package:flutter_mvvm/module/common/network/base_api.dart';

class IndexAPI extends BaseAPI {
  IndexAPI(
      {required super.path,
      required super.method,
      super.params,
      super.headers,
      super.type});

  
  static IndexAPI listRequest(int page) {

    return IndexAPI(path: 'list', method: HttpMethod.get);
  }
}
