
import 'package:flutter_mvvm/module/common/network/base_model.dart';

enum HttpMethod {
  get,
  post
}

abstract class BaseAPI<T extends BaseModel> {

  BaseAPI({
    required this.path,
    required this.method,
    this.params,
    this.headers,
    this.type
  });



  final String path;
  final HttpMethod method;
  final Map<String, dynamic>? params;
  final Map? headers;
  final T? type;
}