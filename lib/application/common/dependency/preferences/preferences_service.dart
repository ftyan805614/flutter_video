import 'dart:convert';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/constants/index.dart';
import 'package:polynesia/application/data/index.dart';

/// 存储服务
class PreferencesService {
  /// 获取用户TOKEN
  Future<String?> loadUserApiToken() async {
    UserEntity? model;
    String? string = await Pref().getString(PrefKey.apiToken);
    return string;
  }

  Future<bool> cacheUserApiToken(String? apiToken) async {
    return Pref().setString(PrefKey.apiToken, apiToken);
  }

  /// 用户模型
  Future<UserDetailEntity?> loadUserInfo() async {
    UserDetailEntity? model;
    String? jsonString = await Pref().getJSON(PrefKey.userInfo);
    if (jsonString != null) {
      model = UserDetailEntity.fromJson(jsonDecode(jsonString));
    }
    return model;
  }

  Future<bool> cacheUserInfo(UserDetailEntity? userInfo) async {
    return Pref().setJSON(PrefKey.userInfo, userInfo?.toString());
  }

  /// App配置
  Future<List<ConfigEntity>?> loadAppConfig() async {
    List<ConfigEntity>? appConfig;
    String? jsonString = await Pref().getJSON(PrefKey.appConfig);
    if (jsonString != null) {
      appConfig = (jsonDecode(jsonString) as List).map((item) => ConfigEntity.fromJson(item)).toList();
    }
    return appConfig;
  }

  Future<bool> cacheAppConfig(List<ConfigEntity>? appConfig) async {
    return Pref().setJSON(PrefKey.appConfig, appConfig?.toString());
  }
}
