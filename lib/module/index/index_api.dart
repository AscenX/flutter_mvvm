import 'package:flutter_mvvm/module/common/network/base_api.dart';

class IndexAPI extends BaseAPI {
  IndexAPI(
      {required super.path,
      required super.method,
      super.params,
      super.headers,
      super.type});

  
  static IndexAPI listRequest(Map<String, dynamic> params) {

    return IndexAPI(path: 'get', method: HttpMethod.get, params: params);
  }

  static IndexAPI detailRequest(Map<String, dynamic> params) {

    return IndexAPI(path: 'get', method: HttpMethod.get, params: params);
  }
}
