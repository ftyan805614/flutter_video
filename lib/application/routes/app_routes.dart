import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/components/web/web_page.dart';
import 'package:polynesia/application/modules/cstservice/pages/suggetion/views/suggestion_page.dart';
import 'package:polynesia/application/modules/root/pages/splash_page.dart';
import 'package:polynesia/application/modules/root/root_page.dart';
import 'package:polynesia/application/modules/user/pages/device/device_info_page.dart';
import 'package:polynesia/application/modules/user/pages/me/views/about_us_page.dart';
import 'package:polynesia/application/modules/user/pages/me/views/contact_us_page.dart';
import 'package:polynesia/application/modules/user/pages/password_edit/index.dart';
import 'package:polynesia/application/modules/user/pages/personal/views/mobile_bind_page.dart';
import 'package:polynesia/application/modules/user/pages/personal/views/personal_data_page.dart';
import 'package:polynesia/application/modules/user/pages/set/set_page.dart';
import 'package:polynesia/application/modules/user/pages/user_signin/user_signin_page.dart';

import '../modules/user/pages/me/views/help_center_page.dart';

part 'app_routes_ext.dart';

enum PageTransitionType { push, present }

class AppRoutes {
  static const splash = '/splash';
  static const root = '/root';
  static const customerService = '/customerService';
  static const user = '/user';
  static const web = '/web';
  static const signin = '/signin';
  static const set = '/set';
  static const personalData = '/personal';
  static const deviceInfo = '/device';
  static const passwordEdit = '/password';
  static const bindMobile = '/user/bindmobile';
  static const helpCenter = '/user/helpCenter';
  static const contactUs = '/user/contactUs';
  static const abouttUs = '/user/abouttUs';
  static const suggestion = '/service/suggestion';

  /// 动态路由指定
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return AppRoutesExtension._generateRoute(settings);
  }
}
