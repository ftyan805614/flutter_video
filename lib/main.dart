import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:polynesia/application/routes/app_routes.dart';
import 'package:polynesia/application/services/index.dart';
import 'package:polynesia/application/theme/index.dart';
import 'package:provider/provider.dart';

void main() async {
  /// 依赖注入
  setupServiceDependency();

  // Be sure to add this line if `PackageInfo.fromPlatform()` is called before runApp()
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<ApplicationService>(create: (_) => ApplicationService()),
        ChangeNotifierProvider.value(
          value: serviceDependency.get<ApplicationService>(),
        ),
        ChangeNotifierProvider.value(
          value: serviceDependency.get<UserService>(),
        ),
        // ChangeNotifierProvider<UserService>(create: (_) => UserService())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          backgroundColor: TColor.primaryBackground,
          scaffoldBackgroundColor: TColor.primaryBackground,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        navigatorObservers: [routeObserver],
        builder: EasyLoading.init(),
      ),
    );
  }
}
