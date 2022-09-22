import 'package:polynesia/application/data/index.dart';

class UserAPI {
  /// login
  static API<UserEntity> login(username, password) {
    Map<String, dynamic> params = {
      "username": username,
      "password": password,
      "supUid1": 0
    };
    return API(APIPoly.login, params, (data) {
      return UserEntity.fromJson(data);
    });
  }

  /// phone login
  static API<UserEntity> phonelogin(phone, code) {
    Map<String, dynamic> params = {
      "mobile": phone,
      "code": code,
      "areaCode": "86",
    };
    return API(APIPoly.phonelogin, params, (data) {
      return UserEntity.fromJson(data);
    });
  }

  /// userinfo
  static API<UserDetailEntity> userDetail() {
    Map<String, dynamic> params = {};
    return API(APIPoly.userDetail, params, (data) {
      return UserDetailEntity.fromJson(data);
    });
  }

  /// updateUserProfile
  static API<UserDetailEntity> updateUserProfile(params) {
    return API(APIPoly.updateUserProfile, params, (data) {
      return UserDetailEntity.fromJson(data);
    });
  }

  /// smscode
  static API<bool> smsCode(phone) {
    Map<String, dynamic> params = {"mobile": phone, "areaCode": "86"};
    return API(APIPoly.smsCode, params, (data) {
      return true;
    });
  }

  /// signup
  static API<UserEntity> signup(String username, String password, String mobile,
      String smsCode, String promoCode) {
    Map<String, dynamic> params = {};
    if (mobile.isEmpty) {
      params = {
        "areaCode": "86",
        "password": password,
        "promoCode": promoCode,
        "username": username
      };
    } else {
      params = {
        "areaCode": "86",
        "mobile": mobile,
        "password": password,
        "promoCode": promoCode,
        "smsCode": smsCode,
        "username": username
      };
    }

    return API(APIPoly.signup, params, (data) {
      return UserEntity.fromJson(data);
    });
  }

  /// get messages list
  static API<MessagesEntity> getUserMessages(params) {
    return API(APIPoly.messages, params, (data) {
      return MessagesEntity.fromJson(data);
    });
  }

  /// delete the message
  static API<bool> deleteMessage(params) {
    return API(APIPoly.deleteMsg, params, (data) {
      return data;
    });
  }

  /// 重置密码
  static API<bool> resetPassword(params) {
    return API(APIPoly.resetPass, params, (data) {
      return true;
    });
  }

  /// 重置密码
  static API<bool> changePassword(params) {
    return API(APIPoly.changePassword, params, (data) {
      return true;
    });
  }

  /// 修改手机号
  static API<bool> resetMobile(params) {
    return API(APIPoly.resetMobile, params, (data) {
      return true;
    });
  }

  ///登出
  static API<bool> logout(params) {
    return API(APIPoly.logout, params, (data) {
      return true;
    });
  }
}
