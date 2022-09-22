import 'dart:convert';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/common/utils/screen_adapter.dart';
import 'package:polynesia/application/constants/index.dart';
import 'package:polynesia/application/data/models/config_entity.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/user/pages/personal/viewModels/personal_data_model.dart';
import 'package:polynesia/application/modules/user/pages/personal/views/avatars_bottom_drawer.dart';
import 'package:polynesia/application/routes/app_routes.dart';
import 'package:polynesia/application/services/index.dart';
import 'package:provider/provider.dart';

class PersonalData extends BaseWidget {
  const PersonalData({Key? key}) : super(key: key);

  @override
  State<BaseWidget> getState() => PersonalDataPageState();
}

class PersonalDataPageState extends BaseWidgetState<PersonalData> {
  @override
  void initState() {
    super.initState();

    UserService userService = context.read<UserService>();
    PersonalDataModel viewModel = context.read<PersonalDataModel>();
    viewModel.setUserInfo(userService.userInfo);
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    PersonalDataModel viewModel =
        Provider.of<PersonalDataModel>(context, listen: true);

    double drawerHeight = ScreenAdaper.getScreenHeight();

    return ListView(
      children: [
        GestureDetector(
          onTap: () {
            showFlexibleBottomSheet(
              minHeight: 0,
              initHeight: 240 / drawerHeight,
              maxHeight: 240 / drawerHeight,
              isExpand: false,
              context: context,
              builder: (
                BuildContext context,
                ScrollController scrollController,
                double bottomSheetOffset,
              ) {
                return ListenableProvider.value(
                  value: viewModel,
                  child: AvatarsBottomDrawer(
                    onConfirmed: (String avatar) {
                      viewModel.setAvatar(avatar);
                    },
                  ),
                );
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 13.5, horizontal: 26),
            color: ColorUtil.fromHex('#3C4861'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "个人头像",
                  style: TextStyle(
                    height: 1.4,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: ColorUtil.fromHex('#EAEBEE'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CircleAvatar(
                  radius: 27,
                  backgroundImage: AssetImage("$avatarDir${viewModel.avatar}"),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 57.5),
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
                            Map<String, dynamic> h5json = cstServiceJson['h5'];
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
  }
}
