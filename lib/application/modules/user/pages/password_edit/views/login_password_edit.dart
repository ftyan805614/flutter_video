import 'package:flutter/material.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/common/widget/common_submit_buttom.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/user/pages/password_edit/views/information_cell.dart';
import 'package:polynesia/application/modules/user/pages/password_edit/viewModels/login_password_model.dart';

class LoginPasswordEdit extends BaseWidget {
  const LoginPasswordEdit({
    Key? key,
  }) : super(key: key);

  @override
  State<BaseWidget> getState() => LoginPasswordEditState();
}

class LoginPasswordEditState extends BaseWidgetState<LoginPasswordEdit> {
  @override
  Widget build(BuildContext context) {
    return UnitView<LoginPasswordModel>(
      viewModel: LoginPasswordModel(),
      builder: (context, viewModel, child) {
        return ListView(
          children: [
            InformationCell(
              focusNode: viewModel.oldPwdNode,
              controller: viewModel.oldPwdController,
              label: "原登录密码",
              hintText: "请输入原密码",
              onChanged: (value) {
                viewModel.oldPwd = value.trim();
              },
              onSubmitted: (value) {
                viewModel.newPwdNode.requestFocus();
              },
              obscureText: true,
            ),
            const SizedBox(height: 5),
            InformationCell(
              focusNode: viewModel.newPwdNode,
              controller: viewModel.newPwdController,
              label: "新登录密码",
              hintText: "8-20位字母或数字",
              onChanged: (value) {
                viewModel.newPwd = value.trim();
              },
              onSubmitted: (value) {
                viewModel.confirmedPwdNode.requestFocus();
              },
              obscureText: true,
            ),
            const SizedBox(height: 5),
            InformationCell(
              focusNode: viewModel.confirmedPwdNode,
              controller: viewModel.confirmedPwdController,
              label: "确认新密码",
              hintText: "8-20位字母或数字",
              onChanged: (value) {
                viewModel.confirmedPwd = value.trim();
              },
              onSubmitted: (value) {
                viewModel.onSubmitted();
              },
              obscureText: true,
            ),
            const SizedBox(height: 5),
            CommonSubmitButton(
              "修改登录密码",
              horizontal: 16,
              vertical: 15,
              fontSize: 15,
              onPressed: () async {
                bool success = await viewModel.onSubmitted();
                if (success) {
                  onShowToast("登陆密码修改成功");
                  onBack();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
