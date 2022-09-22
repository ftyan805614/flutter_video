import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/user/pages/root/viewModels/user_root_view_model.dart';
import 'package:polynesia/application/routes/app_routes.dart';
import 'package:polynesia/application/services/index.dart';
import 'package:provider/provider.dart';

class UserTableWidget extends BaseWidget {
  const UserTableWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> getState() {
    return _UserTableWidgetState();
  }
}

class _UserTableWidgetState extends BaseWidgetState<UserTableWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserRootViewModel>(
      builder: (_, viewModel, child) {
        return Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              children: [
                Container(
                  color: ColorUtil.fromHex('2E3955'),
                  height: 52,
                  child: InkWell(
                    onTap: () {
                      onPush(AppRoutes.helpCenter);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 15,
                            ),
                            Image(
                              image: AssetImage("assets/images/user_help.png"),
                              width: 17,
                              height: 17,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "帮助中心",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "存取款、投注有疑问吗，看这里",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorUtil.fromHex('95A4B3')),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Image(
                                image:
                                    AssetImage("assets/images/user_arrow.png")),
                            const SizedBox(
                              width: 15,
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
                InkWell(
                  onTap: () {
                    onPush(AppRoutes.contactUs);
                  },
                  child: Container(
                      color: ColorUtil.fromHex('2E3955'),
                      height: 52,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                width: 15,
                              ),
                              Image(
                                image:
                                    AssetImage("assets/images/user_join.png"),
                                width: 17,
                                height: 17,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "加入我们",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "合营计划",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ColorUtil.fromHex('95A4B3')),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Image(
                                  image: AssetImage(
                                      "assets/images/user_arrow.png")),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    onPush(AppRoutes.abouttUs);
                  },
                  child: Container(
                    color: ColorUtil.fromHex('2E3955'),
                    height: 52,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 15,
                            ),
                            Image(
                              image: AssetImage("assets/images/user_about.png"),
                              width: 17,
                              height: 17,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "关于澳门澳博",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorUtil.fromHex('95A4B3')),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Image(
                                image:
                                    AssetImage("assets/images/user_arrow.png")),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }
}
