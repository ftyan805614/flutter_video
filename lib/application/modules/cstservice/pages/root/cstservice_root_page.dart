import 'package:flutter/material.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/common/utils/screen_adapter.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/routes/app_routes.dart';

class CstServiceRootPage extends BaseWidget {
  const CstServiceRootPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> getState() {
    return _CstServiceRootPageState();
  }
}

class _CstServiceRootPageState extends BaseWidgetState<CstServiceRootPage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    return Scaffold(
      backgroundColor: ColorUtil.fromHex('E5E5E5'),
      body: Stack(
        children: [
          const Image(image: AssetImage('assets/images/cst_navbg.png')),
          Column(
            children: [
              AppBar(
                  title: const Text("我的客服"),
                  elevation: 0,
                  centerTitle: true,
                  backgroundColor: TColor.primaryColor,
                  titleTextStyle:
                      const TextStyle(color: Colors.white, fontSize: 17),
                  actions: [
                    TextButton(
                        onPressed: () {
                          onPush(AppRoutes.suggestion);
                        },
                        child: const Text(
                          '意见反馈',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ))
                  ]),
            ],
          ),
        ],
      ),
    );
  }
}
