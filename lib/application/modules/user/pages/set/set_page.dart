import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:polynesia/application/common/utils/color_util.dart';
import 'package:polynesia/application/common/widget/common_submit_buttom.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/routes/app_routes.dart';

import '../../../../constants/app_exception.dart';
import '../../../../data/apis/user_api.dart';
import '../../../../data/services/network/api_service.dart';

class SetPage extends BaseWidget {
  const SetPage({Key? key}) : super(key: key);

  @override
  State<BaseWidget> getState() {
    return _SetState();
  }
}

class _SetState extends BaseWidgetState<SetPage> {
  String version = '';

  void getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  void initState() {
    super.initState();

    getPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.primaryColor,
      appBar: AppBar(
        title: const Text("设置"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: TColor.primaryColor,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                onPush(AppRoutes.passwordEdit);
              },
              child: Container(
                color: ColorUtil.fromHex('#3C4861'),
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 26,
                        ),
                        Text(
                          "修改密码",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Image(
                            image: AssetImage("assets/images/user_arrow.png")),
                        SizedBox(
                          width: 26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: ColorUtil.fromHex('#3C4861'),
              height: 52,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      SizedBox(
                        width: 26,
                      ),
                      Text(
                        "清除缓存",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        // "15M",
                        "Unknown",
                        style: TextStyle(
                            color: ColorUtil.fromHex('#95A4B3'), fontSize: 12),
                      ),
                      const SizedBox(
                        width: 26,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                onPush(AppRoutes.deviceInfo);
              },
              child: Container(
                color: ColorUtil.fromHex('#3C4861'),
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 26,
                        ),
                        Text(
                          "设备信息",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Image(
                            image: AssetImage("assets/images/user_arrow.png")),
                        SizedBox(
                          width: 26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: ColorUtil.fromHex('#3C4861'),
              height: 52,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      SizedBox(
                        width: 26,
                      ),
                      Text(
                        "检查更新",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "当前版本 v$version",
                        style: TextStyle(
                            color: ColorUtil.fromHex('#95A4B3'), fontSize: 12),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 34,
                        height: 16,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorUtil.fromHex('#F7B575'),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Text(
                          'NEW',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 26,
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CommonSubmitButton(
                "退出",
                onPressed: () async {
                  try {
                    onShowLoading();
                    bool success =
                        await APIService.api().post(UserAPI.logout(null));
                    if (success) {
                      onPresent(AppRoutes.signin);
                      onShowToast("退出登录成功");
                    }
                    onHiddenToast();
                  } on APIException catch (e) {
                    onShowToast(e.getMessage());
                    onHiddenToast();
                  } catch (e) {
                    onHiddenToast();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
