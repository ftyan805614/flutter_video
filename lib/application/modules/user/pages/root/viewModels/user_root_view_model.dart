import 'package:flutter/cupertino.dart';
import 'package:polynesia/application/data/index.dart';
import 'package:polynesia/application/services/index.dart';

class UserRootViewModel with ChangeNotifier {
  UserService userService = serviceDependency.get<UserService>();

  /// 页面再次显示
  void onAppear() {
    userService.refreshUserInfo();
  }
}
