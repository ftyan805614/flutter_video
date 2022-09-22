import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'interceptors/api.dart';
import 'interceptors/cache.dart';
import 'interceptors/error.dart';
import 'interceptors/logging.dart';

enum DioMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
}

class DioUtil {
  // factory DioUtil() => _instance;
  // static final DioUtil _instance = DioUtil._();
  //
  // static DioUtil get instance => _instance;

  /// 连接超时时间
  static const int _connectTimeout = 60 * 1000;

  /// 响应超时时间
  static const int _receiveTimeout = 60 * 1000;

  /// 声明Dio变量
  late final Dio _dio;
  final CancelToken _cancelToken = CancelToken();

  /// 初始化
  DioUtil.init(String? host, {int connectTimeout = _connectTimeout, int receiveTimeout = _receiveTimeout}) {
    // 初始化基本选项
    BaseOptions options = BaseOptions(
      baseUrl: host ?? '',
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );

    // 初始化dio
    _dio = Dio(options);

    // 加载拦截器
    _dio.interceptors.add(APIInterceptor());
    // 添加error拦截器
    _dio.interceptors.add(ErrorInterceptor());
    // 添加日志拦截器
    _dio.interceptors.add(LoggingInterceptor());
  }

  /// 请求类
  Future<Response> _request(
    String path, {
    DioMethod method = DioMethod.get,
    Map<String, dynamic>? params,
    data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.put: 'put',
      DioMethod.delete: 'delete',
      DioMethod.patch: 'patch',
      DioMethod.head: 'head'
    };

    if (options != null) {
      options.method ??= methodValues[method];
    } else {
      options = Options(method: methodValues[method]);
    }

    try {
      Response response;
      response = await _dio.request(
        path,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioError {
      rethrow;
    }
  }

  /// 请求类
  Future<T> _requestData<T>(
    String path, {
    DioMethod method = DioMethod.get,
    Map<String, dynamic>? params,
    data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.put: 'put',
      DioMethod.delete: 'delete',
      DioMethod.patch: 'patch',
      DioMethod.head: 'head'
    };

    if (options != null) {
      options.method ??= methodValues[method];
    } else {
      options = Options(method: methodValues[method]);
    }

    try {
      Response response;
      response = await _dio.request<T>(
        path,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioError {
      rethrow;
    }
  }

  // 关闭dio
  void cancelRequests({required CancelToken token}) {
    token.cancel("cancelled");
    // token ?? _cancelToken.cancel("cancelled");
  }

  /// 设置Http代理(设置即开启)
  void setProxy({required String proxyAddress, bool enable = false}) {
    if (enable) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        client.findProxy = (uri) {
          return proxyAddress;
        };
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return null;
      };
    }
  }

  /// GET
  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    bool noCache = !cacheEnable,
    String? cacheKey,
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(
      extra: {
        "refresh": refresh,
        "noCache": noCache,
        "cacheKey": cacheKey,
        "cacheDisk": cacheDisk,
      },
    );
    return _requestData(
      path,
      method: DioMethod.get,
      params: params,
      cancelToken: cancelToken,
      options: requestOptions,
    );
  }

  /// POST
  Future post<T>(
    String path, {
    Map<String, dynamic>? params,
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _requestData<T>(
      path,
      method: DioMethod.post,
      data: data,
      params: params,
      cancelToken: cancelToken,
      options: options,
    );
  }

  /// POST FILE
  Future postFile(
    String path, {
    Map<String, dynamic>? params,
    data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    return _request(
      path,
      method: DioMethod.post,
      data: data,
      params: params,
      cancelToken: cancelToken,
      options: options,
      onSendProgress: onSendProgress,
    );
  }

  /// PUT
  Future put(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    return _request(
      path,
      method: DioMethod.put,
      data: data,
      params: params,
      cancelToken: cancelToken,
      options: options,
      onSendProgress: onSendProgress,
    );
  }

  /// PATCH
  Future patch(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _request(
      path,
      method: DioMethod.patch,
      data: data,
      params: params,
      options: options,
    );
  }

  /// DELETE
  Future delete(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _request(
      path,
      method: DioMethod.delete,
      data: data,
      params: params,
      cancelToken: cancelToken,
      options: options,
    );
  }

  /// DELETE
  Future head(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _request(
      path,
      method: DioMethod.head,
      data: data,
      params: params,
      cancelToken: cancelToken,
      options: options,
    );
  }
}
