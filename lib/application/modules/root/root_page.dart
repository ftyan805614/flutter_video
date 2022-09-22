import 'package:flutter/material.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/activity/root/activity_root_page.dart';
import 'package:polynesia/application/modules/activity/root/view_models/activity_view_model.dart';
import 'package:polynesia/application/modules/cstservice/pages/root/cstservice_root_page.dart';
import 'package:polynesia/application/modules/cstservice/pages/root/viewModels/cstservice_view_model.dart';
import 'package:polynesia/application/modules/home/pages/root/home_root_page.dart';
import 'package:polynesia/application/modules/home/pages/root/viewModels/home_view_model.dart';
import 'package:polynesia/application/modules/root/view_models/root_view_model.dart';
import 'package:polynesia/application/modules/user/pages/root/user_root_page.dart';
import 'package:polynesia/application/modules/user/pages/root/viewModels/user_root_view_model.dart';
import 'package:polynesia/application/routes/app_routes.dart';
import 'package:polynesia/application/services/index.dart';
import 'package:provider/provider.dart';

/// 跟页面

class PolyRootPage extends StatelessWidget {
  PolyRootPage({Key? key, this.selectedIndex = 0}) : super(key: key);
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RootViewModel(),
      child: RootPage(selectedIndex: selectedIndex),
    );
  }
}

class RootPage extends BaseWidget {
  RootPage({Key? key, this.selectedIndex = 0}) : super(key: key);
  int selectedIndex = 0;
  @override
  State<BaseWidget> getState() => _RootPageState();
}

class _RootPageState extends BaseWidgetState<RootPage> with TokenInvalidMixin {
  HomeViewModel homeViewModel = HomeViewModel();
  UserRootViewModel userRootViewModel = UserRootViewModel();
  ActivityViewModel activityViewModel = ActivityViewModel();

  List<ABottomBarItem> tabBarItems = [
    ABottomBarItem("assets/images/tab_home.png", "assets/images/tab_home_select.png", "社群"),
    ABottomBarItem("assets/images/tab_active.png", "assets/images/tab_active_select.png", "视讯"),
    ABottomBarItem("assets/images/tab_cust.png", "assets/images/tab_cust_select.png", "直播"),
    ABottomBarItem("assets/images/tab_set.png", "assets/images/tab_set_select.png", "我的"),
  ];

  /// 首页根页面
  Widget _homeRootPage() {
    return ChangeNotifierProvider.value(
      value: homeViewModel,
      child: const HomeRootPage(),
    );
  }

  /// 优惠活动
  Widget _activityRootPage() {
    return ChangeNotifierProvider.value(
      value: activityViewModel,
      child: const ActivityRootPage(),
    );
  }

  /// 客服
  Widget _cstServiceRootPage() {
    return ChangeNotifierProvider(
      create: (_) => CstServiceViewModel(),
      child: const CstServiceRootPage(),
    );
  }

  /// 我的根页面

  Widget _userRootPage() {
    return ChangeNotifierProvider.value(
      value: userRootViewModel,
      child: const UserRootPage(),
    );
  }

  List<Widget> homePages() {
    return [
      _homeRootPage(),
      _activityRootPage(),
      _cstServiceRootPage(),
      _userRootPage(),
    ];
  }

  @override
  void initState() {
    super.initState();
    UserService userService = serviceDependency.get<UserService>();
    userService.tokenInvalidMixin = this;
  }

  @override
  Widget build(BuildContext context) {
    RootViewModel viewModel = Provider.of<RootViewModel>(context);
    if (widget.selectedIndex > 0) {
      Future.delayed(Duration.zero, () {
        viewModel.switchSelectedIndex(widget.selectedIndex);
      });
      widget.selectedIndex = 0;
    }

    /// 底部栏点击
    void _tabBarItemOnTap(int index) {
      viewModel.switchSelectedIndex(index);
      if (index == 1) {
        activityViewModel.onAppear();
      }

      if (index == 3) {
        UserService userService = serviceDependency.get<UserService>();
        if (!userService.isAuthed) {
          viewModel.rollbackSelectedIndex();
          onPresent(AppRoutes.signin);
        } else {
          userRootViewModel.onAppear();
        }
      }
    }

    /// 创建底部菜单栏
    BottomNavigationBar _buildBottomNavigationBar() {
      return BottomNavigationBar(
        currentIndex: viewModel.selectedIndex,
        backgroundColor: TColor.appBarBackground,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedItemColor: TColor.bottomTitleColor,
        selectedItemColor: TColor.bottomTitleSelectColor,
        type: BottomNavigationBarType.fixed,
        items: tabBarItems,
        onTap: (index) {
          _tabBarItemOnTap(index);
        },
      );
    }

    return Scaffold(
      body: Consumer<RootViewModel>(builder: (_, viewModel, child) {
        return IndexedStack(
          index: viewModel.selectedIndex,
          children: homePages(),
        );
      }),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  /// TokenInvalidMixin
  @override
  Future<void> userTokenDidInvalid(String message) async {
    onPresent(AppRoutes.signin);
    onShowToast(message);
  }
}

// bar item
class ABottomBarItem extends BottomNavigationBarItem {
  ABottomBarItem(String imageName, String selectImageName, String title)
      : super(
          icon: Image.asset(
            imageName,
            width: 24,
            height: 24,
          ),
          activeIcon: Image.asset(
            selectImageName,
            width: 24,
            height: 24,
          ),
          label: title,
        );
}
