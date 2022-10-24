import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/module/common/network/env_manager.dart';

class NetworkClient {
  Dio? _dio;

  static const timeout = 1000 * 20;

  // 使用单例
  factory NetworkClient() => _getInstance();

  static NetworkClient get shared => _getInstance();
  static NetworkClient? _shared;

  NetworkClient._internal() {
    if (_dio == null) {
      BaseOptions options = BaseOptions();
      options.baseUrl = EnvManager.host;
      options.receiveTimeout = timeout;
      options.connectTimeout = timeout;
      _dio = Dio(options);
    }
  }

  static NetworkClient _getInstance() {
    _shared ??= NetworkClient._internal();
    return _shared!;
  }

  Map<String, dynamic> setupCommonHeaders(Map<String, dynamic>? headers) {
    Map<String, dynamic> allHeaders = {
      'version': '0.0.1',
    };
    allHeaders['token'] = 'token';
    allHeaders['accept'] = 'application/json';
    allHeaders['Content-Type'] = 'application/json';

    if (headers != null) {
      allHeaders.addAll(headers);
    }

    return allHeaders;
  }

  Stream request(
      {required String path,
      required String method,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers}) async* {

    Map<String, dynamic> allHeaders = setupCommonHeaders(headers);

    ResponseType respType = ResponseType.json;
    Options opts =
        Options(method: method, headers: allHeaders, sendTimeout: timeout, responseType: respType);

    if (kDebugMode) {
      print(
        'HTTP request,path:${EnvManager.host}$path method:$method params:$params');
    }

    try {
      if (method == 'get') {
        yield await _dio!.request(path, options: opts, queryParameters: params);
      } else {
        yield await _dio!.request(path, options: opts, data: params);
      }
    } catch (e) {
      if (kDebugMode) {
        print('HTTP request error:$e');
      }
      yield e;
    }
  }
}
