import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/user/pages/me/views/contact_us_widget.dart';

class ContactUsPage extends BaseWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> getState() {
    return _ContactUsPageState();
  }
}

class _ContactUsPageState extends BaseWidgetState<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('联系我们'),
        centerTitle: true,
        backgroundColor: TColor.appBarBackground,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
      ),
      body: const ContactUsWidget(),
    );
  }
}
