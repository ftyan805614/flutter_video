import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/home/pages/root/viewModels/home_view_model.dart';
import 'package:polynesia/application/services/index.dart';
import 'package:provider/provider.dart';

class HomeRootPage extends BaseWidget {
  const HomeRootPage({Key? key}) : super(key: key);

  @override
  State<BaseWidget> getState() => _HomeRootPageState();
}

class _HomeRootPageState extends BaseWidgetState<HomeRootPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _length1 = 50;
  final int _length2 = 50;
  DateTime lastRefreshTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    // HomeViewModel viewModel = Provider.of<HomeViewModel>(context);
    // viewModel.onInit();
    // _tabController = TabController(initialIndex: 0, length: viewModel.gameModels?.length ?? 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var appService = Provider.of<ApplicationService>(context);
    HomeViewModel viewModel = Provider.of<HomeViewModel>(context);
    // viewModel.onInit();

    return Scaffold(
      backgroundColor: TColor.primaryColor,
      body: const Center(
        child: Text(
          "首页",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
