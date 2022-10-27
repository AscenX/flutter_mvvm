
import 'package:flutter_mvvm/module/common/base/base_model.dart';

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
  final Map<String, dynamic>? headers;
  final T? type;
}