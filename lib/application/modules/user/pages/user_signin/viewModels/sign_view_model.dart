import 'package:polynesia/application/data/index.dart';
import 'package:polynesia/application/modules/components/index.dart';

class SignViewModel extends BaseViewModel {
  ///登录注册切换
  int? _index = 0;
  int? get index {
    return _index;
  }

  setIndex(int? index) {
    _index = index;
    notifyListeners();
  }

  ///注册短信验证码按钮文字
  String? _codeCountdownStr = "获取验证码";
  String? get codeCountdownStr {
    return _codeCountdownStr;
  }

  setCodeCountdownStr(String? codeCountdownStr) {
    _codeCountdownStr = codeCountdownStr;
    notifyListeners();
  }

  ///登录方式切换
  int? _loginType = 0;
  int? get loginType {
    return _loginType;
  }

  setLoginType(int? loginType) {
    _loginType = loginType;
    notifyListeners();
  }

  ///登录
  Future<UserEntity?> signin(String username, String password) async {
    try {
      onShowLoading();
      UserEntity userModel = await APIService.api().post(UserAPI.login(username, password));
      onHiddenToast();
      return userModel;
    } catch (e) {
      onShowError(e.toString());
    }
    return null;
  }

  ///手机号登录
  Future<UserEntity?> phonelogin(String phone, String code) async {
    try {
      onShowLoading();
      UserEntity userModel = await APIService.api().post(UserAPI.phonelogin(phone, code));
      onHiddenToast();
      return userModel;
    } catch (e) {
      onShowError(e.toString());
    }
    return null;
  }

  ///请求验证码
  Future<bool> fetchSmsCode(String phone) async {
    try {
      onShowLoading();
      bool result = await APIService.api().post(UserAPI.smsCode(phone));
      onHiddenToast();
      return result;
    } catch (e) {
      onShowError(e.toString());
    }
    return false;
  }

  ///注册接口
  Future<UserEntity?> signup(String username, String password, String mobile, String smsCode, String promoCode) async {
    try {
      onShowLoading();
      UserEntity userModel = await APIService.api().post(UserAPI.signup(username, password, mobile, smsCode, promoCode));
      onHiddenToast();
      return userModel;
    } catch (e) {
      onShowError(e.toString());
    }
    return null;
  }
}
