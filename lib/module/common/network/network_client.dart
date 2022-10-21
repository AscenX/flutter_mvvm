import 'package:dio/dio.dart';
import 'package:flutter_mvvm/module/common/network/env_manager.dart';

class NetworkClient {

  Dio? _dio;

  // 使用单例
  factory NetworkClient() =>_getInstance();
  static NetworkClient get shared => _getInstance();
  static NetworkClient? _shared;
  NetworkClient._internal() {
    if (_dio == null) {
      BaseOptions options = BaseOptions();
      options.baseUrl = EnvManager.host;
      options.receiveTimeout = 1000 * 20; //20秒
      options.connectTimeout = 1000 * 20;
      _dio = Dio(options);
    }
  }
  static NetworkClient _getInstance() {
    _shared ??= NetworkClient._internal();
    return _shared!;
  }

  Stream request({required String path, required String method, Map<String, dynamic>? params}) async* {
    try {
      print('HTTP request,path:${EnvManager.host}$path method:$method param:$params');
      yield await _dio!.request(path, options: Options(method: method));
    } catch (e) {
      print('HTTP request error:$e');
      yield e;
    }
  }
  
}