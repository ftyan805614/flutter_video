import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/routes/app_routes.dart';
import 'package:polynesia/application/services/index.dart';

class SplashPage extends BaseWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<BaseWidget> getState() => _SplashPageState();
}

class _SplashPageState extends BaseWidgetState<SplashPage> {
  void onDidFinishLaunching() async {
    ApplicationService service = serviceDependency.get<ApplicationService>();
    await service.onDidFinishLaunching();
    Get.offAllNamed(AppRoutes.root);
  }

  @override
  void initState() {
    super.initState();
    onDidFinishLaunching();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
