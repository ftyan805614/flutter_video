import 'package:dio/dio.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/constants/index.dart';
import 'package:polynesia/application/data/index.dart';
import 'package:polynesia/application/services/index.dart';

/// API请求服务
class APIService {
  late DioUtil _du;

  // APIService() {
  //   String path = '${APIPoly.apiHost}${APIPoly.apiVersion}';
  //   _du = DioUtil.init(path);
  // }

  APIService(String host) {
    _du = DioUtil.init(host);
  }

  /// 普通
  factory APIService.api() {
    String path = '${APIPoly.apiHost}${APIPoly.apiVersion}';
    return APIService(path);
  }

  /// 支付模块
  factory APIService.payment() {
    String path = '${APIPoly.apiHost}${APIPoly.paymentVersion}';
    return APIService(path);
  }
  //paymentVersion

  /// 统一处理返回数据
  Future<T> _handleResponse<T>(
    API<T> resource,
    Map<String, dynamic> jsonData,
  ) async {
    // 处理数据
    int code = jsonData['code'];
    String msg = jsonData['msg'];
    dynamic data = jsonData['data'];
    if (code == 0) {
      return resource.parse(data);
    }

    /// error统一处理
    UserService authService = serviceDependency.get<UserService>();
    if (code == 401) {
      authService.apiTokenExpired();
    }
    throw APIException(code, msg);
  }

  /// GET
  Future<T> get<T>(API<T> resource) async {
    try {
      final data = await _du.get(resource.path, params: resource.params);

      if (data is Map<String, dynamic>) {
        return _handleResponse(resource, data);
      } else {
        throw AppException.customNetwork("返回的数据不是JSON");
      }
    } on DioError catch (e) {
      if (e.error is AppException) {
        throw e.error;
      } else {
        throw AppException.customNetwork(e.toString());
      }
    } catch (e) {
      if (e is AppException) {
        rethrow;
      } else {
        throw AppException.customNetwork(e.toString());
      }
    }
  }

  /// POST
  Future<T> post<T>(API<T> resource) async {
    try {
      var data = await _du.post(
        resource.path,
        data: resource.params,
      );

      if (data is Map<String, dynamic>) {
        return _handleResponse(resource, data);
      } else {
        throw AppException.customNetwork("返回的数据不是JSON");
      }
    } on DioError catch (e) {
      if (e.error is AppException) {
        throw e.error;
      } else {
        throw AppException.customNetwork(e.toString());
      }
    } catch (e) {
      if (e is AppException) {
        rethrow;
      } else {
        throw AppException.customNetwork("服务器发生错误,请检查网络或者稍后再试!");
        // throw AppException.customNetwork(e.toString());
      }
    }
  }
}
