import 'package:polynesia/application/data/index.dart';

class PlatAPI {
  static API<List<PlatEntity>> platList() {
    Map<String, dynamic> params = {};
    return API(APIPoly.platList, params, (data) {
      return (data as List).map((item) => PlatEntity.fromJson(item)).toList();
    });
  }

  static API<String?> platYue(int platId) {
    Map<String, dynamic> params = {'id': platId};
    return API(APIPoly.platYue, params, (data) {
      return data['coin'];
    });
  }

  static API<String?> coinDownBatch(List platList) {
    Map<String, dynamic> params = {'reqBodyList': platList};
    return API(APIPoly.coinDownBatch, params, (data) {
      return data['coin'];
    });
  }

  static API<List<PlatEntity>> gameList() {
    return API(APIPoly.gameList, null, (data) {
      return (data as List).map((item) => PlatEntity.fromJson(item)).toList();
    });
  }

  static API<List<MsgEntity>> listCategory() {
    return API(APIPoly.listCategory, null, (data) {
      return (data as List).map((item) => MsgEntity.fromJson(item)).toList();
    });
  }

  static API<bool> addFeedback(params) {
    return API(APIPoly.addFeedback, params, (data) {
      return true;
    });
  }
}
