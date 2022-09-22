import 'package:dio/dio.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/services/index.dart';

/// 业务API拦截器实现
class APIInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 对非open的接口的请求参数全部增加userId
    if (!options.path.contains("open")) {
      // options.queryParameters["userId"] = "xxx";
    }

    UserService authService = serviceDependency.get<UserService>();
    String? apiToken = authService.apiToken;
    if (apiToken != null) {
      options.headers["Authorization"] = "Bearer $apiToken";
    }
    options.headers["accept"] = "application/json;charset=utf-8";
    options.headers["accept-language"] = "zh";
    options.headers["accept-device"] = "m";
    // 更多业务需求
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    var data = response.data;
    // 请求成功是对数据做基本处理

    // if (response.statusCode == 200) {
    //   response.data = DioResponse(code: 0, message: "请求成功啦", data: response);
    // } else {
    //   response.data = DioResponse(code: 1, message: "请求失败啦", data: response);
    // }
    //
    // // 对某些单独的url返回数据做特殊处理
    // if (response.requestOptions.baseUrl.contains("???????")) {
    //   //....
    // }

    // 根据业务需求进行定制化处理

    // 重点
    handler.next(response);
  }
}

/// 数据结果集
class DioResponse<T> {
  /// 消息(例如成功消息文字/错误消息文字)
  final String message;

  /// 自定义code(可根据内部定义方式)
  final int code;

  /// 接口返回的数据
  final T data;

  /// 需要添加更多
  /// .........

  DioResponse({
    required this.message,
    required this.data,
    required this.code,
  });

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write("\"message\":\"$message\"");
    sb.write(",\"errorMsg\":\"$code\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}
