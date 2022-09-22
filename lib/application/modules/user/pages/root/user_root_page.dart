import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/user/pages/root/views/action_widget.dart';
import 'package:polynesia/application/modules/user/pages/root/views/profile_widget.dart';
import 'package:polynesia/application/modules/user/pages/root/views/usertable_widget.dart';
import 'package:polynesia/application/modules/user/pages/root/views/vip_widget.dart';
import 'package:polynesia/application/routes/app_routes.dart';
import 'package:polynesia/application/services/user/user_service.dart';
import 'package:provider/provider.dart';

class UserRootPage extends BaseWidget {
  const UserRootPage({Key? key}) : super(key: key);

  @override
  State<BaseWidget> getState() {
    return _UserPageState();
  }
}

class _UserPageState extends BaseWidgetState<UserRootPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(builder: (_, userService, Widget? child) {
      if (!userService.isAuthed) {
        return Container();
      }
      return Scaffold(
          backgroundColor: TColor.primaryColor,
          appBar: AppBar(
            title: const Text("我的"),
            elevation: 0,
            centerTitle: true,
            backgroundColor: TColor.primaryColor,
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
            actions: [
              IconButton(
                onPressed: () {
                  onPush(AppRoutes.set);
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Image.asset(
                  "assets/images/user_set.png",
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(width: 13),
              IconButton(
                onPressed: () {
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Image.asset(
                  "assets/images/user_msg.png",
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(width: 13),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileWidget(),
              VipWidget(),
              ActionWidget(),
              const UserTableWidget(),
            ],
          ));
    });
  }
}
