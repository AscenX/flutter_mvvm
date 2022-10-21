// 构建Stream api request

import 'package:flutter_mvvm/module/common/network/base_api.dart';
import 'package:flutter_mvvm/module/common/network/network_client.dart';

extension APIRequest on BaseAPI {

  Stream request() {
    return NetworkClient.shared.request(path: path, method: method.name, params: params);
  }

}