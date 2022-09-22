import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/routes/app_routes.dart';
// import 'package:polynesia/main.dart';
export 'package:polynesia/application/theme/index.dart';
import 'toast_mixin.dart';

/// 基础的逻辑组件,只包含业务
abstract class BaseWidget extends StatefulWidget {
  const BaseWidget({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => getState();
  State<StatefulWidget> getState();
}

abstract class BaseWidgetState<T extends BaseWidget> extends State<T> with ToastMixin, RouteAware {
  /// 显示加载动画
  @override
  void onShowLoading() {
    EasyLoading.show();
  }

  /// 显示提示
  @override
  void onShowToast(String message) {
    EasyLoading.showToast(message);
  }

  /// 显示错误提示
  @override
  void onShowError(String message) {
    EasyLoading.showError(message);
  }

  /// 隐藏提示或者加载动画
  @override
  void onHiddenToast() {
    EasyLoading.removeAllCallbacks();
    EasyLoading.dismiss();
  }

  /// 页面跳转: Push
  /// @routeName 页面路由名称
  /// @args 传递参数
  void onPush(String routeName, {dynamic args}) {
    if (routeName == AppRoutes.customerService) {
      Get.offAllNamed(routeName);
      return;
    } else if (routeName == AppRoutes.user) {
      Get.offAllNamed(routeName);
      return;
    }
    Get.toNamed(routeName, arguments: args);
  }

  /// 页面跳转: Present
  /// @routeName 页面路由名称
  /// @args 传递参数
  void onPresent(String routeName, {dynamic args}) {
    Map<String, dynamic> params = {"transitionType": PageTransitionType.present};
    if (args != null) {
      if (args is Map<String, dynamic>) {
        params.addAll(args);
      } else {
        Log.d("参数非法");
      }
    }
    Get.toNamed(routeName, arguments: params);
  }

  /// 页面回退
  /// @root 是否销毁所有页面并返回到首页
  void onBack({bool root = false}) {
    if (root) {
      Get.offAllNamed(AppRoutes.root);
    } else {
      Get.back();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  /// 当Push到该页面时：
  @override
  void didPush() {
    Log.d('$runtimeType:didPush');
  }

  /// 当Pop到该页面时
  @override
  void didPopNext() {
    Log.d('$runtimeType:didPopNext');
  }

  /// 当该页面Push到其他页面时：
  @override
  void didPushNext() {
    Log.d('$runtimeType:didPushNext');
  }

  /// 当该页面被Pop时
  @override
  void didPop() {
    Log.d('$runtimeType:didPop');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    onHiddenToast();
    super.dispose();
  }
}
