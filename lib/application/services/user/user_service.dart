import 'package:flutter/foundation.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/data/index.dart';

enum AuthenticateStatus { uninitialized, authenticated, authenticating, unauthenticated }

/// token失效
mixin TokenInvalidMixin {
  Future<void> userTokenDidInvalid(String message);
}

class UserService with ChangeNotifier {
  /// 缓存服务
  PreferencesService prefService = serviceDependency.get<PreferencesService>();
  TokenInvalidMixin? tokenInvalidMixin;

  /// 用户模型
  String? _apiToken;
  String? get apiToken {
    return _apiToken;
  }

  setApiToken(String? token) {
    if (token != _apiToken) {
      _apiToken = token;
      notifyListeners();
    }
  }

  /// 当前用户是否登录
  bool get isAuthed {
    return _apiToken != null ? true : false;
  }

  UserDetailEntity? _userInfo;
  UserDetailEntity? get userInfo {
    return _userInfo;
  }

  setUserInfo(UserDetailEntity? model) {
    if (model != _userInfo) {
      _userInfo = model;
      notifyListeners();
    }
  }

  /// ============================Private============================
  /// 清除用户数据
  Future<void> _cleanUserData() async {
    setApiToken(null);
    setUserInfo(null);
    await prefService.cacheUserApiToken(null);
    await prefService.cacheUserInfo(null);
  }

  /// ============================Features============================

  /// 初始化数据
  Future<void> onInit() async {
    String? token = await prefService.loadUserApiToken();
    if (token != null) {
      setApiToken(token);

      UserDetailEntity? userInfo = await prefService.loadUserInfo();
      setUserInfo(userInfo);

      refreshUserInfo();
    }
  }

  /// 用户登录
  Future<void> userDidSignin(String apiToken) async {
    setApiToken(apiToken);
    await prefService.cacheUserApiToken(apiToken);
    refreshUserInfo();
  }

  /// 用户推出
  Future<void> userDidSignout() async {
    _cleanUserData();
  }

  /// AuthenticationMixin
  Future<void> apiTokenExpired() async {
    Log.d("apiToken过期");
    await _cleanUserData();

    tokenInvalidMixin?.userTokenDidInvalid("登录失效,请重新登录!");
  }

  /// 获得用户详细信息
  Future<void> refreshUserInfo() async {
    if (apiToken == null) {
      return;
    }
    try {
      UserDetailEntity userDetailEntity = await APIService.api().post(UserAPI.userDetail());
      await prefService.cacheUserInfo(userDetailEntity);
      setUserInfo(userDetailEntity);
    } catch (e) {
      Log.d("获取用户信息错误");
    }
  }
}
