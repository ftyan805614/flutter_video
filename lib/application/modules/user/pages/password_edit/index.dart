import 'package:flutter/material.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/common/utils/screen_adapter.dart';
import 'package:polynesia/application/modules/user/pages/password_edit/views/login_password_edit.dart';
import 'package:polynesia/application/modules/user/pages/password_edit/views/withdrawal_password_edit.dart';

class PasswordEditPage extends BaseWidget {
  const PasswordEditPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BaseWidget> getState() => PasswordEditPageState();
}

class PasswordEditPageState extends BaseWidgetState<PasswordEditPage> {
  static int pageCount = 2;
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);

    double screenWidth = ScreenAdaper.getScreenWidth();
    int indicatorWidth = 37;
    double indicatorPadding = ((screenWidth / pageCount) - indicatorWidth) / 2;

    return DefaultTabController(
      initialIndex: tabIndex,
      length: pageCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('修改密码'),
          backgroundColor: TColor.appBarBackground,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                tabIndex = index;
              });
            },
            indicatorColor: ColorUtil.fromHex('#F0C59A'),
            indicatorPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: indicatorPadding),
            tabs: [
              Tab('登录密码', active: tabIndex == 0),
              Tab('资金密码', active: tabIndex == 1),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LoginPasswordEdit(),
            WithdrawalPasswordEdit(),
          ],
        ),
      ),
    );
  }
}

class Tab extends StatelessWidget {
  const Tab(this.label, {Key? key, this.active = false}) : super(key: key);
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            height: 1.4,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: active
                ? ColorUtil.fromHex('#F0C59A')
                : ColorUtil.fromHex('#848DA4'),
          ),
        ),
      ),
    );
  }
}
