
import 'api.dart';
import 'constants.dart';

class MoneyAPI {
  ///取款
  static API<bool> withdrawAdd(double coin,String coinPassword,int bankid) {
    Map<String, dynamic> params = {};
    params = {
      "coin" :coin,
      "coinPassword" :coinPassword,
      "id" :bankid,
    };
    return API(APIPoly.withdrawalAdd, params, (data) {
      return true;
    });
  }

  ///转账
  static API<bool> coinTransfer(String coin,int direction,int platId) {
    Map<String, dynamic> params = {};
    params = {
      "coin" :coin,
      "direction" :direction,
      "id" :platId,
    };
    return API(APIPoly.coinTransfer, params, (data) {
      return true;
    });
  }
}