/// APP信息配置
class AppKey {
  static const String appId = 'com.polynesia.spring';
  static const String appName = 'Polynesia';
  static const String appVersion = '1.0.0';
  static const String buildVersion = '878';
}

/// 日志配置
class LogPoly {
  static const bool log = true;

  /// 是否打印请求头
  static const bool logRequestHeader = false;

  /// 是否打印响应头
  static const bool logResponseHeader = false;
}

/// 是否开启debug模式
const bool kDebugMode = true;

typedef PVoidCallback = void Function();

class PResponseCode {
  static const int success = 0;
  // Token认证过期
  static const int tokenExpired = 902;
}

// avatar 檔案路徑
String avatarDir = 'assets/images/user';
