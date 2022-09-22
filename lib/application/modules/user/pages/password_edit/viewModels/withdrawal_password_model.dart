import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/common/index.dart';

import '../../../../../constants/app_exception.dart';
import '../../../../../data/apis/user_api.dart';
import '../../../../../data/services/network/api_service.dart';

class WithdrawalPasswordModel extends BaseViewModel {
  String oldPwd = '';
  String newPwd = '';
  String confirmedPwd = '';

  TextEditingController get oldPwdController =>
      TextEditingController(text: oldPwd);
  TextEditingController get newPwdController =>
      TextEditingController(text: newPwd);
  TextEditingController get confirmedPwdController =>
      TextEditingController(text: confirmedPwd);

  final FocusNode oldPwdNode = FocusNode();
  final FocusNode newPwdNode = FocusNode();
  final FocusNode confirmedPwdNode = FocusNode();

  Future<bool> onSubmitted() async {
    Log.d({
      "oldPwd": oldPwd,
      "newPwd": newPwd,
      "confirmedPwd": confirmedPwd,
    });

    if (oldPwd.isEmpty) {
      onShowError("请输入原资金密码");
      oldPwdNode.requestFocus();
      return false;
    }
    if (newPwd.isEmpty) {
      onShowError("请输入新资金密码");
      newPwdNode.requestFocus();
      return false;
    }
    if (confirmedPwd.isEmpty) {
      onShowError("请输入确认密码");
      confirmedPwdNode.requestFocus();
      return false;
    }

    Map<String, dynamic> params = {
      "category": 2,
      "oldPassword": oldPwd,
      "newPassword": newPwd,
      "confirmPassword": confirmedPwd
    };
    try {
      onShowLoading();
      bool success =
      await APIService.api().post(UserAPI.changePassword(params));
      onHiddenToast();
      return success;
    } on APIException catch (e) {
      onShowToast(e.getMessage());
      onHiddenToast();
    } catch (e) {
      print((e));
      onHiddenToast();
    }
    return false;
  }
}
