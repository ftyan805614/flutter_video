import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/constants/img_prefix.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/user/pages/root/viewModels/user_root_view_model.dart';
import 'package:polynesia/application/routes/app_routes.dart';
import 'package:polynesia/application/services/index.dart';
import 'package:provider/provider.dart';

class HelpCenterWidget extends BaseWidget {
  const HelpCenterWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> getState() {
    return _HelpCenterWidgetState();
  }
}

class _HelpCenterWidgetState extends BaseWidgetState<HelpCenterWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Container(
              color: ColorUtil.fromHex('2E3955'),
              height: 52,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:  [
                      const SizedBox(
                        width: 15,
                      ),
                      Image(
                        image: AssetImage("${ImgPrefix.userImagePre}ic_helpcenter_deposit.png"),
                        width: 17,
                        height: 17,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "存款教程",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Image(
                          image:
                          AssetImage("assets/images/user_arrow.png")),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
                color: ColorUtil.fromHex('2E3955'),
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children:  [
                        const SizedBox(
                          width: 15,
                        ),
                        Image(
                          image: AssetImage("${ImgPrefix.userImagePre}ic_helpcenter_withdraw.png"),
                          width: 17,
                          height: 17,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "取款教程",
                          style:
                          TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Image(
                            image:
                            AssetImage("assets/images/user_arrow.png")),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ],
                )),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: ColorUtil.fromHex('2E3955'),
              height: 52,
              child: InkWell(
                onTap: (){
                  onPush(AppRoutes.contactUs);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children:  [
                        const SizedBox(
                          width: 15,
                        ),
                        Image(
                          image: AssetImage("${ImgPrefix.userImagePre}ic_helpcenter_contact_us.png"),
                          width: 17,
                          height: 17,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "联系我们",
                          style: TextStyle(fontSize: 15, color: Colors.white),
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
  }
}
