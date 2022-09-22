import 'dart:convert';

import 'package:polynesia/application/data/index.dart';
import 'package:polynesia/application/data/models/level_rebate_entity.dart';
import 'package:polynesia/application/data/models/vip_level_info_entity.dart';

class ActivityAPI {
  /// login
  static API<List<PromotionEntity>> promotionsList() {
    return API(APIPoly.promotionsList, null, (data) {
      ///
      return (data as List).map((item) => PromotionEntity.fromJson(item)).toList();
    });
  }

  ///vip会员成长
  static API<List<VipLevelInfoEntity>> levelList() {
    return API(APIPoly.levelList, null, (data) {
      return (data as List).map((item) => VipLevelInfoEntity.fromJson(item)).toList();
    });
  }

  ///vip全场返水
  static API<List<LevelRebateEntity>> levelRebateList() {
    return API(APIPoly.levelRebateList, null, (data) {
      return (data as List).map((item) => LevelRebateEntity.fromJson(item)).toList();
    });
  }
}
