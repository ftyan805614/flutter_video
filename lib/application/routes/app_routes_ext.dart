part of 'app_routes.dart';

/// 路由中间件
extension AppRoutesExtension on AppRoutes {
  static Route<dynamic> _generateRoute(RouteSettings settings) {
    PageTransitionType transitionType = PageTransitionType.push;
    if (settings.arguments != null && settings.arguments is Map<String, dynamic>) {
      Map<String, dynamic> params = settings.arguments as Map<String, dynamic>;
      if (params["transitionType"] != null) {
        transitionType = params["transitionType"];
      }
    }

    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          switch (settings.name) {
            case AppRoutes.splash:
              return const SplashPage();
            case AppRoutes.root:
              int selectedIndex = 0;
              if (settings.arguments != null) {
                Map<String, dynamic> params = settings.arguments! as Map<String, dynamic>;
                if (params["selectedIndex"] != null) {
                  selectedIndex = params["selectedIndex"];
                }
              }

              return PolyRootPage(selectedIndex: selectedIndex);
            case AppRoutes.customerService:
              return PolyRootPage(selectedIndex: 2);
            case AppRoutes.user:
              return PolyRootPage(selectedIndex: 3);
            case AppRoutes.web:
              Map<String, String> params = settings.arguments! as Map<String, String>;
              String url = params["url"]!;
              String? title = params["title"];
              return WebPage(url, title: title);
            case AppRoutes.signin:
              return const UserSigninPage();
            case AppRoutes.personalData:
              return const PersonalDataPage();
            case AppRoutes.deviceInfo:
              return const DeviceInfoPage();
            case AppRoutes.passwordEdit:
              return const PasswordEditPage();
            case AppRoutes.set:
              return const SetPage();
            case AppRoutes.bindMobile:
              return const MobileBindPage();
            case AppRoutes.helpCenter:
              return const HelpCenterPage();
            case AppRoutes.contactUs:
              return const ContactUsPage();
            case AppRoutes.abouttUs:
              return const AboutUsPage();
            case AppRoutes.suggestion:
              return const SuggestionPage();
            default:
              return Scaffold(body: Center(child: Text('没有找到对应的页面：${settings.name}')));
          }
        },
        opaque: false,
        transitionDuration: const Duration(milliseconds: 250),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: transitionType == PageTransitionType.push ? const Offset(1, 0) : const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );

          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
              child: child,
            ),
          );
        });
  }
}
