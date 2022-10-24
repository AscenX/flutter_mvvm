
class HttpResponse {

  int _code = 0;
  int get code => _code;


  dynamic _data;
  dynamic get data => _data;

  late String _message = '';
  String get message => _message;

  HttpResponse.fromJson(dynamic resp) {
    _code = resp['code'];
    _data = resp['data'];
    _message = resp['message'];
  }

}