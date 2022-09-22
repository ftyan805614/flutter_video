import 'package:flutter/material.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/cstservice/pages/suggetion/viewmodel/suggestion_viewmodel.dart';
import 'package:polynesia/application/modules/cstservice/pages/suggetion/views/suggestion_content_widget.dart';

class SuggestionPage extends BaseWidget {
  const SuggestionPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> getState() {
    return _SuggestionPageState();
  }
}

class _SuggestionPageState extends BaseWidgetState<SuggestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('意见反馈'),
        centerTitle: true,
        backgroundColor: TColor.appBarBackground,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
      ),
      body:  UnitView(viewModel: SuggestionViewModel(), builder: (BuildContext context, SuggestionViewModel model, Widget? child) {
        return const SuggestionContentWidget();
      },)
    );
  }
}
