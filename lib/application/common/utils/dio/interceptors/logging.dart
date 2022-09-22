import 'package:dio/dio.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/constants/index.dart';
import 'package:polynesia/application/services/index.dart';

/// 日志拦截器
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Map<String, dynamic> requestMap = {
      'baseUrl': response.requestOptions.baseUrl,
      'path': response.requestOptions.path,
    };
    // 是否打印请求头
    if (LogPoly.logRequestHeader) {
      requestMap['headers'] = response.requestOptions.headers;
    }
    if (response.requestOptions.queryParameters.isNotEmpty) {
      requestMap['queryParameters'] = response.requestOptions.queryParameters;
    }
    if (response.requestOptions.data != null) {
      if (response.requestOptions.data is Map<String, dynamic>) {
        Map<String, dynamic> mapData = response.requestOptions.data;
        requestMap['data'] = mapData;
      }
    }

    Map<String, dynamic> responseMap = {'statusCode': response.statusCode, 'data': response.data};

    // 是否打印返回头
    if (LogPoly.logResponseHeader) {
      responseMap['headers'] = response.headers.map;
    }
    if (response.extra.isNotEmpty) {
      responseMap['extra'] = response.extra;
    }

    if (LogPoly.log) {
      Log.d({'request': requestMap, 'response': responseMap});
    }

    UserService authService = serviceDependency.get<UserService>();
    // if (appException.getCode == 401) {
    //   /// 过期,
    //   authService.apiTokenExpired();
    // }

    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
