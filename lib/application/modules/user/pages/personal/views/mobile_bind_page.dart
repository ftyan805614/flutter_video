import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/user/pages/personal/viewModels/personal_data_model.dart';
import 'package:polynesia/application/modules/user/pages/personal/views/mobile_bind_content.dart';

import '../../../../../common/utils/string_util.dart';

class MobileBindPage extends BaseWidget {
  final Function(String)? onPressed;

  const MobileBindPage({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<StatefulWidget> getState() => _MobileBindPageState();
}

class _MobileBindPageState extends BaseWidgetState<MobileBindPage> {
  @override
  Widget build(BuildContext context) {
    var viewModel = PersonalDataModel();
    return Scaffold(
        appBar: AppBar(
          title: const Text('手机号码'),
          centerTitle: true,
          backgroundColor: TColor.appBarBackground,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
          actions: [
            InkWell(
              onTap: () async {
                if (isEmpty(viewModel.phoneNumber)) {
                  onShowToast("请输入手机号码");
                  return;
                }
                if (viewModel.phoneNumber.length != 11) {
                  onShowToast("请输入正确的手机号码");
                  return;
                }
                if (isEmpty(viewModel.smsCode)) {
                  onShowToast("请输入短信验证码");
                  return;
                }
                bool suc = await viewModel.resetMobile();
                print(viewModel.phoneNumber);
                print(viewModel.smsCode);
                if (suc) {
                  Get.back(result: viewModel.phoneNumber);
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Center(
                  child: Text(
                    "完成",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
        body: UnitView(
          viewModel: viewModel,
          builder:
              (BuildContext context, PersonalDataModel model, Widget? child) {
            return const MobileBindContent();
          },
        ));
  }
}
