// 构建Stream api request

import 'package:flutter_mvvm/module/common/network/base_api.dart';
import 'package:flutter_mvvm/module/common/network/http_response.dart';
import 'package:flutter_mvvm/module/common/network/network_client.dart';
import 'package:rxdart/rxdart.dart';

extension APIRequest on BaseAPI {
  Stream request() {
    return NetworkClient.shared
        .request(
            path: path, method: method.name, params: params, headers: headers);
        // .map((event) => {
        //       // HttpResponse.fromJson(event.data)
        //     })
        // .doOnData((event) {
        //   print('11111111 doOnData: $event');
        // })
        // .doOnError((p0, p1) {
        //   print('11111111 doOnError: $p0, $p1');
        // });
  }
}
