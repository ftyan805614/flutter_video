import 'dart:async';
import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/user/pages/personal/viewModels/personal_data_model.dart';
import 'package:provider/provider.dart';

import '../../../../../data/models/config_entity.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../services/application/application_service.dart';
import '../../password_edit/views/information_cell.dart';

class MobileBindContent extends BaseWidget {
  const MobileBindContent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> getState() => _MobileBindContentState();
}

class _MobileBindContentState extends BaseWidgetState<MobileBindContent> {
  int _countdownNum = 59;
  Timer? _countdownTimer;

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (
      BuildContext context,
      PersonalDataModel viewModel,
      Widget? child,
    ) {
      return ListView(
        children: [
          InformationCell(
            controller: viewModel.phoneNumberController,
            label: "手机号码",
            hintText: "请输入11位的手机号码",
            maxLength: 11,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              viewModel.phoneNumber = value.trim();
            },
            onSubmitted: (value) {},
          ),
          const SizedBox(
            height: 5,
          ),
          Stack(
            children: [
              InformationCell(
                controller: viewModel.smsCodeController,
                label: "手机验证码",
                hintText: "请输入手机验证码",
                maxLength: 7,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  viewModel.smsCode = value.trim();
                },
                onSubmitted: (value) {},
              ),
              Positioned(
                right: 15,
                bottom: 8,
                child: InkWell(
                  onTap: () async{
                    /// 请求验证码
                    bool? result =
                        await viewModel.fetchSmsCode(viewModel.phoneNumber);
                    if (result) {
                      viewModel.setCodeCountdownStr(
                          '${_countdownNum--}重新获取');
                      _countdownTimer = Timer.periodic(
                          const Duration(seconds: 1),
                              (timer) {
                            setState(() {
                              if (_countdownNum > 0) {
                                viewModel.setCodeCountdownStr(
                                    '${_countdownNum--}重新获取');
                              } else {
                                viewModel
                                    .setCodeCountdownStr('获取验证码');
                                _countdownNum = 59;
                                _countdownTimer?.cancel();
                              }
                            });
                          });
                    }
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xffF0C59A), width: 1),
                        borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: Text(
                        viewModel.codeCountdownStr ?? '',
                        style: TextStyle(
                            fontSize: 11, color: ColorUtil.fromHex("#F0C59A")),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 57.5),
              child: Consumer<ApplicationService>(
                builder: (context, service, child) {
                  return Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: '为了您的隐私安全，信息在确认后将无法修改如需帮助，请',
                      style: const TextStyle(
                        height: 1.4,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              ConfigEntity config = service.appConfig![5];
                              Map<String, dynamic> cstServiceJson =
                                  json.decode(config.value!);
                              Map<String, dynamic> h5json =
                                  cstServiceJson['h5'];
                              String cstUrl = h5json['url'];

                              onPush(
                                AppRoutes.web,
                                args: {"url": cstUrl, "title": "在线客服"},
                              );
                            },
                          text: '联系客服',
                          style: TextStyle(
                            height: 1.4,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: ColorUtil.fromHex('#DFC3A8'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
