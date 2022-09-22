import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/user/pages/me/views/help_center_widget.dart';

class HelpCenterPage extends BaseWidget {
  const HelpCenterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> getState() {
    return _HelpCentePageState();
  }
}

class _HelpCentePageState extends BaseWidgetState<HelpCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('帮助中心'),
        centerTitle: true,
        backgroundColor: TColor.appBarBackground,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
      ),
      body: const HelpCenterWidget(),
    );
  }
}
