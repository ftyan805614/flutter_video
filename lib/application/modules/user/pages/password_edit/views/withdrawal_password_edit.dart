import 'package:flutter/material.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/user/pages/password_edit/views/information_cell.dart';
import 'package:polynesia/application/modules/user/pages/password_edit/viewModels/withdrawal_password_model.dart';

import '../../../../../common/widget/common_submit_buttom.dart';

class WithdrawalPasswordEdit extends BaseWidget {
  const WithdrawalPasswordEdit({
    Key? key,
  }) : super(key: key);

  @override
  State<BaseWidget> getState() => WithdrawalPasswordEditState();
}

class WithdrawalPasswordEditState
    extends BaseWidgetState<WithdrawalPasswordEdit> {
  @override
  Widget build(BuildContext context) {
    return UnitView<WithdrawalPasswordModel>(
      viewModel: WithdrawalPasswordModel(),
      builder: (context, viewModel, child) {
        return ListView(
          children: [
            InformationCell(
              focusNode: viewModel.oldPwdNode,
              controller: viewModel.oldPwdController,
              label: "原资金密码",
              hintText: "请输入原资金密码",
              onChanged: (value) {
                viewModel.oldPwd = value.trim();
              },
              onSubmitted: (value) {
                viewModel.newPwdNode.requestFocus();
              },
              obscureText: true,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 5),
            InformationCell(
              focusNode: viewModel.newPwdNode,
              controller: viewModel.newPwdController,
              label: "资金密码",
              hintText: "请输入6位数字资金密码",
              onChanged: (value) {
                viewModel.newPwd = value.trim();
              },
              onSubmitted: (value) {
                viewModel.confirmedPwdNode.requestFocus();
              },
              obscureText: true,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 5),
            InformationCell(
              focusNode: viewModel.confirmedPwdNode,
              controller: viewModel.confirmedPwdController,
              label: "确认密码",
              hintText: "请输入6位数字密码",
              onChanged: (value) {
                viewModel.confirmedPwd = value.trim();
              },
              onSubmitted: (value) {
                viewModel.onSubmitted();
              },
              obscureText: true,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 5),
            CommonSubmitButton(
              "修改资金密码",
              horizontal: 16,
              fontSize: 15,
              vertical: 15,
              onPressed: () async {
                bool success = await viewModel.onSubmitted();
                if (success) {
                  onShowToast("资金密码修改成功");
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
