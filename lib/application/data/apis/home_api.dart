import 'package:polynesia/application/data/index.dart';

class HomeAPI {
  /// 首页数据
  static API<HomeEntity> homeData() {
    return API(APIPoly.homeIndex, null, (data) {
      return HomeEntity.fromJson(data);
    });
  }
}
