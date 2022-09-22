import 'package:flutter/material.dart';
import 'package:polynesia/application/constants/img_prefix.dart';
import 'package:polynesia/application/modules/components/index.dart';

class AboutUsPage extends BaseWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> getState() {
    return _AboutUsPageState();
  }
}

class _AboutUsPageState extends BaseWidgetState<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于澳门澳博'),
        centerTitle: true,
        backgroundColor: TColor.appBarBackground,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("${ImgPrefix.userImagePre}ic_about_top.png"),
          const SizedBox(height: 60,),
          Image.asset("${ImgPrefix.userImagePre}ic_about_sponsor.png",width: 250,height: 240,),
        ],
      ),
    );
  }
}
