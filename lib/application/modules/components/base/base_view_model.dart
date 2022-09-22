import 'package:flutter/material.dart';
import 'package:polynesia/application/constants/index.dart';
import 'package:polynesia/application/modules/components/index.dart';

/// 页面交互状态
enum ViewState { idle, busy }

abstract class BaseViewModel extends ChangeNotifier with ToastMixin {
  /// 弹窗和加载动画相关
  ToastMixin? toastMixin;

  /// 是否释放
  bool disposed = false;

  /// 页面状态
  ViewState _state = ViewState.idle;
  ViewState get state => _state;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  /// 是否业务异常
  AppException? _exception;
  AppException? get exception => _exception;
  void setException(AppException? exception) {
    _exception = exception;
    notifyListeners();
  }

  @override
  void dispose() {
    toastMixin = null;
    super.dispose();
    disposed = true;
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }

  /// ToastMixin
  /// 显示加载动画
  @override
  void onShowLoading() {
    toastMixin?.onShowLoading();
  }

  /// 显示提示
  @override
  void onShowToast(String message) {
    toastMixin?.onShowToast(message);
  }

  /// 显示错误提示
  @override
  void onShowError(String message) {
    toastMixin?.onShowError(message);
  }

  /// 隐藏提示或者加载动画
  @override
  void onHiddenToast() {
    toastMixin?.onHiddenToast();
  }
}
