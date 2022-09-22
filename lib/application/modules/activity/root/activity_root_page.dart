import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/activity/root/view_models/activity_view_model.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:provider/provider.dart';

/// 优惠活动
class ActivityRootPage extends BaseWidget {
  const ActivityRootPage({Key? key}) : super(key: key);

  @override
  State<BaseWidget> getState() => _ActivityRootPageState();
}

class _ActivityRootPageState extends BaseWidgetState<ActivityRootPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("优惠活动"),
              centerTitle: true,
              backgroundColor: TColor.appBarBackground,
              titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        },
        child: Container());
  }
}
