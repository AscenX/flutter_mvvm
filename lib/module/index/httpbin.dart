import 'package:flutter_mvvm/module/common/network/base_model.dart';

/// args : {}
/// headers : {"Accept":"application/json","Accept-Encoding":"gzip, deflate, br","Accept-Language":"zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,en-US;q=0.6","Dnt":"1","Host":"httpbin.org","Referer":"https://httpbin.org/","Sec-Ch-Ua":"\"Chromium\";v=\"106\", \"Google Chrome\";v=\"106\", \"Not;A=Brand\";v=\"99\"","Sec-Ch-Ua-Mobile":"?0","Sec-Ch-Ua-Platform":"\"macOS\"","Sec-Fetch-Dest":"empty","Sec-Fetch-Mode":"cors","Sec-Fetch-Site":"same-origin","User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36","X-Amzn-Trace-Id":"Root=1-635259bc-260293932715295536049e68"}
/// origin : "38.6.229.13"
/// url : "https://httpbin.org/get"

class Httpbin extends BaseModel {
  Httpbin({
      dynamic args, 
      Headers? headers, 
      String? origin, 
      String? url,}){
    _args = args;
    _headers = headers;
    _origin = origin;
    _url = url;
}

  Httpbin.fromJson(dynamic json) {
    _args = json['args'];
    _headers = json['headers'] != null ? Headers.fromJson(json['headers']) : null;
    _origin = json['origin'];
    _url = json['url'];
  }
  dynamic _args;
  Headers? _headers;
  String? _origin;
  String? _url;
Httpbin copyWith({  dynamic args,
  Headers? headers,
  String? origin,
  String? url,
}) => Httpbin(  args: args ?? _args,
  headers: headers ?? _headers,
  origin: origin ?? _origin,
  url: url ?? _url,
);
  dynamic get args => _args;
  Headers? get headers => _headers;
  String? get origin => _origin;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['args'] = _args;
    if (_headers != null) {
      map['headers'] = _headers?.toJson();
    }
    map['origin'] = _origin;
    map['url'] = _url;
    return map;
  }

}

/// Accept : "application/json"
/// Accept-Encoding : "gzip, deflate, br"
/// Accept-Language : "zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,en-US;q=0.6"
/// Dnt : "1"
/// Host : "httpbin.org"
/// Referer : "https://httpbin.org/"
/// Sec-Ch-Ua : "\"Chromium\";v=\"106\", \"Google Chrome\";v=\"106\", \"Not;A=Brand\";v=\"99\""
/// Sec-Ch-Ua-Mobile : "?0"
/// Sec-Ch-Ua-Platform : "\"macOS\""
/// Sec-Fetch-Dest : "empty"
/// Sec-Fetch-Mode : "cors"
/// Sec-Fetch-Site : "same-origin"
/// User-Agent : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36"
/// X-Amzn-Trace-Id : "Root=1-635259bc-260293932715295536049e68"

class Headers {
  Headers({
      String? accept, 
      String? acceptEncoding, 
      String? acceptLanguage, 
      String? dnt, 
      String? host, 
      String? referer, 
      String? secChUa, 
      String? secChUaMobile, 
      String? secChUaPlatform, 
      String? secFetchDest, 
      String? secFetchMode, 
      String? secFetchSite, 
      String? userAgent, 
      String? xAmznTraceId,}){
    _accept = accept;
    _acceptEncoding = acceptEncoding;
    _acceptLanguage = acceptLanguage;
    _dnt = dnt;
    _host = host;
    _referer = referer;
    _secChUa = secChUa;
    _secChUaMobile = secChUaMobile;
    _secChUaPlatform = secChUaPlatform;
    _secFetchDest = secFetchDest;
    _secFetchMode = secFetchMode;
    _secFetchSite = secFetchSite;
    _userAgent = userAgent;
    _xAmznTraceId = xAmznTraceId;
}

  Headers.fromJson(dynamic json) {
    _accept = json['Accept'];
    _acceptEncoding = json['Accept-Encoding'];
    _acceptLanguage = json['Accept-Language'];
    _dnt = json['Dnt'];
    _host = json['Host'];
    _referer = json['Referer'];
    _secChUa = json['Sec-Ch-Ua'];
    _secChUaMobile = json['Sec-Ch-Ua-Mobile'];
    _secChUaPlatform = json['Sec-Ch-Ua-Platform'];
    _secFetchDest = json['Sec-Fetch-Dest'];
    _secFetchMode = json['Sec-Fetch-Mode'];
    _secFetchSite = json['Sec-Fetch-Site'];
    _userAgent = json['User-Agent'];
    _xAmznTraceId = json['X-Amzn-Trace-Id'];
  }
  String? _accept;
  String? _acceptEncoding;
  String? _acceptLanguage;
  String? _dnt;
  String? _host;
  String? _referer;
  String? _secChUa;
  String? _secChUaMobile;
  String? _secChUaPlatform;
  String? _secFetchDest;
  String? _secFetchMode;
  String? _secFetchSite;
  String? _userAgent;
  String? _xAmznTraceId;
Headers copyWith({  String? accept,
  String? acceptEncoding,
  String? acceptLanguage,
  String? dnt,
  String? host,
  String? referer,
  String? secChUa,
  String? secChUaMobile,
  String? secChUaPlatform,
  String? secFetchDest,
  String? secFetchMode,
  String? secFetchSite,
  String? userAgent,
  String? xAmznTraceId,
}) => Headers(  accept: accept ?? _accept,
  acceptEncoding: acceptEncoding ?? _acceptEncoding,
  acceptLanguage: acceptLanguage ?? _acceptLanguage,
  dnt: dnt ?? _dnt,
  host: host ?? _host,
  referer: referer ?? _referer,
  secChUa: secChUa ?? _secChUa,
  secChUaMobile: secChUaMobile ?? _secChUaMobile,
  secChUaPlatform: secChUaPlatform ?? _secChUaPlatform,
  secFetchDest: secFetchDest ?? _secFetchDest,
  secFetchMode: secFetchMode ?? _secFetchMode,
  secFetchSite: secFetchSite ?? _secFetchSite,
  userAgent: userAgent ?? _userAgent,
  xAmznTraceId: xAmznTraceId ?? _xAmznTraceId,
);
  String? get accept => _accept;
  String? get acceptEncoding => _acceptEncoding;
  String? get acceptLanguage => _acceptLanguage;
  String? get dnt => _dnt;
  String? get host => _host;
  String? get referer => _referer;
  String? get secChUa => _secChUa;
  String? get secChUaMobile => _secChUaMobile;
  String? get secChUaPlatform => _secChUaPlatform;
  String? get secFetchDest => _secFetchDest;
  String? get secFetchMode => _secFetchMode;
  String? get secFetchSite => _secFetchSite;
  String? get userAgent => _userAgent;
  String? get xAmznTraceId => _xAmznTraceId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Accept'] = _accept;
    map['Accept-Encoding'] = _acceptEncoding;
    map['Accept-Language'] = _acceptLanguage;
    map['Dnt'] = _dnt;
    map['Host'] = _host;
    map['Referer'] = _referer;
    map['Sec-Ch-Ua'] = _secChUa;
    map['Sec-Ch-Ua-Mobile'] = _secChUaMobile;
    map['Sec-Ch-Ua-Platform'] = _secChUaPlatform;
    map['Sec-Fetch-Dest'] = _secFetchDest;
    map['Sec-Fetch-Mode'] = _secFetchMode;
    map['Sec-Fetch-Site'] = _secFetchSite;
    map['User-Agent'] = _userAgent;
    map['X-Amzn-Trace-Id'] = _xAmznTraceId;
    return map;
  }

}