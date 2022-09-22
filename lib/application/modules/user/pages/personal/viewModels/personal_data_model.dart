import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/data/index.dart';
import 'package:polynesia/application/services/index.dart';

class PersonalDataModel extends BaseViewModel {
  UserService userService = serviceDependency.get<UserService>();

  String username = '';
  String realname = '';
  String phoneNumber = '';
  String email = '';
  String birth = '';
  String avatar = '/avatar/default.png';
  String smsCode = '';

  ///注册短信验证码按钮文字
  String? _codeCountdownStr = "获取验证码";

  setCodeCountdownStr(String? codeCountdownStr) {
    _codeCountdownStr = codeCountdownStr;
    notifyListeners();
  }

  String? get codeCountdownStr {
    return _codeCountdownStr;
  }

  TextEditingController get usernameController => TextEditingController(text: username);

  TextEditingController get realnameController => TextEditingController(text: realname);

  TextEditingController get phoneNumberController => TextEditingController(text: phoneNumber);

  TextEditingController get emailController => TextEditingController(text: email);

  TextEditingController get smsCodeController => TextEditingController(text: smsCode);

  final FocusNode usernameNode = FocusNode();
  final FocusNode realnameNode = FocusNode();
  final FocusNode phoneNumberNode = FocusNode();
  final FocusNode emailNode = FocusNode();

  void setAvatar(String newAvatar) async {
    Map<String, dynamic> params = {
      "avatar": avatar,
    };
    bool suc = await updateUerByParams(params);
    if (suc) {
      avatar = newAvatar;
      notifyListeners();
    }
  }

  void setPhone(String phone) async {
    Map<String, dynamic> params = {
      "avatar": phone,
    };
    bool suc = await updateUerByParams(params);
    if (suc) {
      phoneNumber = phone;
    } else {
      phoneNumber = "";
    }
    notifyListeners();
  }

  void setPhoneFileOnly(String phone) {
    phoneNumber = phone;
    notifyListeners();
  }

  Future<void> setBirthDay(String birthday) async {
    Map<String, dynamic> params = {
      "birthday": birthday,
    };
    bool suc = await updateUerByParams(params);
    if (suc) {
      birth = birthday;
      notifyListeners();
    }
  }

  void setUserInfo(UserDetailEntity? userInfo) {
    username = userInfo?.username ?? "";
    realname = userInfo?.realname ?? "";
    email = userInfo?.email ?? "";
    avatar = userInfo?.avatar ?? "";
    birth = userInfo?.birthday ?? "";
  }

  Future<bool> onSubmitted() async {
    Log.d({
      "username": username,
      "realname": realname,
      "phoneNumber": phoneNumber,
      "email": email,
    });

    if (username.isEmpty) {
      onShowError("请输入用户名");
      usernameNode.requestFocus();
      return false;
    }
    if (realname.isEmpty) {
      onShowError("请输入真实姓名");
      realnameNode.requestFocus();
      return false;
    }
    if (phoneNumber.isEmpty) {
      onShowError("请输入手机号码");
      phoneNumberNode.requestFocus();
      return false;
    }
    if (email.isEmpty) {
      onShowError("请输入电子邮箱");
      emailNode.requestFocus();
      return false;
    }

    return await updateUserProfile();
  }

  Future<bool> updateUserProfile() async {
    try {
      onShowLoading();

      Map<String, dynamic> params = {
        "avatar": avatar,
        "username": username,
        "realname": realname,
        "phoneNumber": phoneNumber,
        "email": email,
      };

      UserDetailEntity userDetailEntity = await APIService.api().post(UserAPI.updateUserProfile(params));

      userService.setUserInfo(userDetailEntity);

      onHiddenToast();
      return true;
    } catch (e) {
      onShowError(e.toString());
    }
    return false;
  }

  Future<bool> updateUserAvatar() async {
    try {
      onShowLoading();

      Map<String, dynamic> params = {
        "avatar": avatar,
      };

      UserDetailEntity userDetailEntity = await APIService.api().post(UserAPI.updateUserProfile(params));

      userService.setUserInfo(userDetailEntity);

      onHiddenToast();
      return true;
    } catch (e) {
      onShowError(e.toString());
    }
    return false;
  }

  Future<bool> updateUerByParams(params) async {
    try {
      onShowLoading();

      UserDetailEntity userDetailEntity = await APIService.api().post(UserAPI.updateUserProfile(params));

      userService.setUserInfo(userDetailEntity);

      onHiddenToast();
      return true;
    } catch (e) {
      onShowError(e.toString());
    }
    return false;
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

  ///重置手机
  Future<bool> resetMobile() async {
    try {
      onShowLoading();
      Map<String, dynamic> params = {"mobile": phoneNumber, "smsCode": smsCode};
      bool result = await APIService.api().post(UserAPI.resetMobile(params));
      onHiddenToast();
      return result;
    } catch (e) {
      onShowError(e.toString());
    }
    return true;
  }
}
