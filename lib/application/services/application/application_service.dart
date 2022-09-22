import 'package:flutter/cupertino.dart';
import 'package:polynesia/application/common/utils/log.dart';
import 'package:polynesia/application/data/apis/config_api.dart';
import 'package:polynesia/application/data/index.dart';
import 'package:polynesia/application/services/index.dart';

class ApplicationService with ChangeNotifier {
  /// 缓存服务
  PreferencesService prefService = serviceDependency.get<PreferencesService>();

  /// APP 冷启动调用
  /// 该函数处理的是进入APP页面之前需要准备的数据例如判断用户是否登陆,第三方服务(BUG追踪,数据统计等)注册
  Future<void> onDidFinishLaunching() async {
    UserService userService = serviceDependency.get<UserService>();
    await userService.onInit();

    List<ConfigEntity>? appConfig = await prefService.loadAppConfig();
    setAppConfig(appConfig);
    refreshAppConfig();
  }

  /// APP配置
  List<ConfigEntity>? _appConfig;
  List<ConfigEntity>? get appConfig {
    return _appConfig;
  }

  setAppConfig(List<ConfigEntity>? appConfig) {
    _appConfig = appConfig;
    notifyListeners();
  }

  ///请求APP配置参数
  Future<void> refreshAppConfig() async {
    try {
      List<ConfigEntity> appConfig = await APIService.api().post(ConfigAPI.appConfig());
      await prefService.cacheAppConfig(appConfig);
      setAppConfig(appConfig);
    } catch (e) {
      Log.d("获取APP配置参数");
    }
  }
}
