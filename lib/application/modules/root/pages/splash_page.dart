import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polynesia/application/constants/img_prefix.dart';
import 'package:polynesia/application/data/cache/hi_cache.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/routes/app_routes.dart';
import 'package:polynesia/application/services/index.dart';

import '../../../data/cache/hi_cache_keys.dart';

class SplashPage extends BaseWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<BaseWidget> getState() => _SplashPageState();
}

class _SplashPageState extends BaseWidgetState<SplashPage> {
  bool _isLastPage = false;
  bool _isFirstLauchApp = false;
  final List<String> _welcomeList = [
    "guide_1.webp",
    "guide_2.webp",
    "guide_1.webp"
  ];

  void onDidFinishLaunching() async {
    ApplicationService service = serviceDependency.get<ApplicationService>();
    await service.onDidFinishLaunching();
    if (!_isFirstLauchApp) {
      Future.delayed(const Duration(milliseconds: 5000), () {
        Get.offAllNamed(AppRoutes.root);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _isFirstLauchApp =
        HiCache.getInstance().getWithDefault(isFirstLauchKey, true) as bool;
    print("_isFirstLauchApp=$_isFirstLauchApp");
    onDidFinishLaunching();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _isFirstLauchApp ? _welcomePage() : _adPage());
  }

  _adPage() {
    return Stack(
      children: [
        Image.asset(
          "${ImgPrefix.guideImagePre}guide_1.webp",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          alignment: Alignment.topRight,
          padding:
              const EdgeInsets.only(left: 0, top: 45, right: 10, bottom: 0),
          child: OutlinedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.root);
            },
            child: const Text(
              "跳过",
              style: TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  _welcomePage() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Swiper(
          pagination: const SwiperPagination(
              margin: EdgeInsets.only(bottom: 40),
              builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.red, color: Colors.green)),
          itemCount: _welcomeList.length,
          loop: false,
          itemBuilder: (context, index) {
            return Image.asset(
              "${ImgPrefix.guideImagePre}${_welcomeList[index]}",
              fit: BoxFit.fill,
            );
          },
          onIndexChanged: (index) {
            setState(() {
              _isLastPage = (_welcomeList.length - 1) == index;
              print("_isLastPage=$_isLastPage");
            });
          },
        ),
        _isLastPage
            ? Positioned(
                bottom: 1,
                child: Container(
                  width: 100,
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black54, width: 1)),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        HiCache.getInstance().setBool(isFirstLauchKey, false);
                        Get.offAllNamed(AppRoutes.root);
                      },
                      child: const Text(
                        "立即体验",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
