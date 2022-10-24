import 'package:flutter_mvvm/module/common/network/base_model.dart';

/// args : {}
/// data : ""
/// files : {}
/// form : {}
/// headers : {"Accept":"application/json","Accept-Encoding":"gzip, deflate, br","Accept-Language":"zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,en-US;q=0.6","Content-Length":"0","Dnt":"1","Host":"httpbin.org","Origin":"https://httpbin.org","Referer":"https://httpbin.org/","Sec-Ch-Ua":"\"Chromium\";v=\"106\", \"Google Chrome\";v=\"106\", \"Not;A=Brand\";v=\"99\"","Sec-Ch-Ua-Mobile":"?0","Sec-Ch-Ua-Platform":"\"macOS\"","Sec-Fetch-Dest":"empty","Sec-Fetch-Mode":"cors","Sec-Fetch-Site":"same-origin","User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36","X-Amzn-Trace-Id":"Root=1-63560610-2ccc4eff74d5f6f5109370fe"}
/// json : null
/// origin : "38.6.229.13"
/// url : "https://httpbin.org/post"

class HttpbinPost extends BaseModel {
  HttpbinPost({
      dynamic args, 
      String? data, 
      dynamic files, 
      dynamic form, 
      Headers? headers, 
      dynamic json, 
      String? origin, 
      String? url,}){
    _args = args;
    _data = data;
    _files = files;
    _form = form;
    _headers = headers;
    _json = json;
    _origin = origin;
    _url = url;
}

  HttpbinPost.fromJson(dynamic json) {
    _args = json['args'];
    _data = json['data'];
    _files = json['files'];
    _form = json['form'];
    _headers = json['headers'] != null ? Headers.fromJson(json['headers']) : null;
    _json = json['json'];
    _origin = json['origin'];
    _url = json['url'];
  }
  dynamic _args;
  String? _data;
  dynamic _files;
  dynamic _form;
  Headers? _headers;
  dynamic _json;
  String? _origin;
  String? _url;
HttpbinPost copyWith({  dynamic args,
  String? data,
  dynamic files,
  dynamic form,
  Headers? headers,
  dynamic json,
  String? origin,
  String? url,
}) => HttpbinPost(  args: args ?? _args,
  data: data ?? _data,
  files: files ?? _files,
  form: form ?? _form,
  headers: headers ?? _headers,
  json: json ?? _json,
  origin: origin ?? _origin,
  url: url ?? _url,
);
  dynamic get args => _args;
  String? get data => _data;
  dynamic get files => _files;
  dynamic get form => _form;
  Headers? get headers => _headers;
  dynamic get json => _json;
  String? get origin => _origin;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['args'] = _args;
    map['data'] = _data;
    map['files'] = _files;
    map['form'] = _form;
    if (_headers != null) {
      map['headers'] = _headers?.toJson();
    }
    map['json'] = _json;
    map['origin'] = _origin;
    map['url'] = _url;
    return map;
  }

}

/// Accept : "application/json"
/// Accept-Encoding : "gzip, deflate, br"
/// Accept-Language : "zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,en-US;q=0.6"
/// Content-Length : "0"
/// Dnt : "1"
/// Host : "httpbin.org"
/// Origin : "https://httpbin.org"
/// Referer : "https://httpbin.org/"
/// Sec-Ch-Ua : "\"Chromium\";v=\"106\", \"Google Chrome\";v=\"106\", \"Not;A=Brand\";v=\"99\""
/// Sec-Ch-Ua-Mobile : "?0"
/// Sec-Ch-Ua-Platform : "\"macOS\""
/// Sec-Fetch-Dest : "empty"
/// Sec-Fetch-Mode : "cors"
/// Sec-Fetch-Site : "same-origin"
/// User-Agent : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36"
/// X-Amzn-Trace-Id : "Root=1-63560610-2ccc4eff74d5f6f5109370fe"

class Headers {
  Headers({
      String? accept, 
      String? acceptEncoding, 
      String? acceptLanguage, 
      String? contentLength, 
      String? dnt, 
      String? host, 
      String? origin, 
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
    _contentLength = contentLength;
    _dnt = dnt;
    _host = host;
    _origin = origin;
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
    _contentLength = json['Content-Length'];
    _dnt = json['Dnt'];
    _host = json['Host'];
    _origin = json['Origin'];
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
  String? _contentLength;
  String? _dnt;
  String? _host;
  String? _origin;
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
  String? contentLength,
  String? dnt,
  String? host,
  String? origin,
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
  contentLength: contentLength ?? _contentLength,
  dnt: dnt ?? _dnt,
  host: host ?? _host,
  origin: origin ?? _origin,
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
  String? get contentLength => _contentLength;
  String? get dnt => _dnt;
  String? get host => _host;
  String? get origin => _origin;
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
    map['Content-Length'] = _contentLength;
    map['Dnt'] = _dnt;
    map['Host'] = _host;
    map['Origin'] = _origin;
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