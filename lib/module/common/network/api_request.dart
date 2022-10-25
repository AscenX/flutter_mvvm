// 构建Stream api request

import 'dart:convert';

import 'package:flutter_mvvm/module/common/network/base_api.dart';
import 'package:flutter_mvvm/module/common/network/http_response.dart';
import 'package:flutter_mvvm/module/common/network/network_client.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:rxdart/rxdart.dart';

extension APIRequest on BaseAPI {
  Stream request() {
    return NetworkClient.shared
        .request(
            path: path, method: method.name, params: params, headers: headers);
  }

  /// 返回模拟数据
  Stream mockRequest() {
    return NetworkClient.shared
        .request(
        path: path, method: method.name, params: params, headers: headers)
        .asyncMap((event) => _loadJson())
        .map((event) {
          String jsonList = event;
          List list = json.decode(jsonList);
          return list;
    });
  }

  Future _loadJson() async {
    final json = await rootBundle.loadString('resource/test.json');
    return json;
  }

}
