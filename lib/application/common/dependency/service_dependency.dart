import 'package:get_it/get_it.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/services/index.dart';

/// 依赖
GetIt serviceDependency = GetIt.instance;

/// 注册依赖注入
void setupServiceDependency() {
  serviceDependency.registerLazySingleton<PreferencesService>(() => PreferencesService());
  // serviceDependency.registerSingleton<PreferencesService>(PreferencesService());
  serviceDependency.registerSingleton<ApplicationService>(ApplicationService());
  serviceDependency.registerSingleton<UserService>(UserService());
  // serviceDependency.registerLazySingleton<UserService>(() => UserService());
}
