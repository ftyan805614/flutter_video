import 'package:polynesia/application/data/index.dart';

class ConfigAPI {
  static API<List<ConfigEntity>> appConfig() {
    Map<String, dynamic> params = {};
    return API(APIPoly.appConfig, params, (data) {
      return (data as List).map((item) => ConfigEntity.fromJson(item)).toList();
    });
  }
}
