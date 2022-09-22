/// Toast mixin
mixin ToastMixin {
  /// 显示加载动画
  void onShowLoading();

  /// 显示提示
  void onShowToast(String message);

  /// 显示错误提示
  void onShowError(String message);

  /// 隐藏提示或者加载动画
  void onHiddenToast();
}
