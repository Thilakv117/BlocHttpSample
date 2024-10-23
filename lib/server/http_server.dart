import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http_interceptor/http/intercepted_http.dart';

import 'httpIntersepter.dart';

class HttpService {
  static var http = InterceptedHttp.build(interceptors: [
    HttpInterceptor(),
  ]);

  static const String domainName = "http://thejustinandrew.pythonanywhere.com";

  static Future httpGet(String url) async {
    var uri = Uri.encodeFull(domainName + url);
    print(uri);
    return await http
        .get(Uri.parse(uri), headers: {"Access-Control-Allow-Origin": "*"});
  }

  static Future httpPost(String url,{var params}) async {
    var uri = Uri.encodeFull(domainName + url);
    print(uri);
    return http.post(Uri.parse(uri),
        headers: {"Access-Control-Allow-Origin": "*"},
        body: params,
        encoding: Encoding.getByName("utf-8"));
  }
}
