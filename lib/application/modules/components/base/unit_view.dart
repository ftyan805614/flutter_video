import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'base_view_model.dart';
import 'base_widget.dart';

/// 拥有Provider处理能力的基础单元
class UnitView<T extends BaseViewModel> extends BaseWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final T viewModel;
  final Widget? child;
  final Function(T)? onViewModelReady;

  const UnitView({
    Key? key,
    required this.viewModel,
    required this.builder,
    this.child,
    this.onViewModelReady,
  }) : super(key: key);

  @override
  State<StatefulWidget> getState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel>
    extends BaseWidgetState<UnitView<T>> {
  late T viewModel;

  @override
  void initState() {
    viewModel = widget.viewModel;
    viewModel.toastMixin = this;
    if (widget.onViewModelReady != null) {
      widget.onViewModelReady!(viewModel);
    }
    super.initState();
  }

  @override
  void dispose() {
    // viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
      create: (BuildContext context) {
        return viewModel;
      },
    );
  }
}
