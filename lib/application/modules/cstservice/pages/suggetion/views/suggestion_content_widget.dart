import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:polynesia/application/common/widget/common_submit_buttom.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/components/input_text_field.dart';
import 'package:polynesia/application/modules/cstservice/pages/suggetion/viewmodel/suggestion_viewmodel.dart';
import 'package:polynesia/application/modules/cstservice/pages/suggetion/views/feedback_list_bottom_drawer.dart';
import 'package:provider/provider.dart';

import '../../../../../common/utils/color_util.dart';
import '../../../../../common/utils/screen_adapter.dart';

class SuggestionContentWidget extends BaseWidget {
  const SuggestionContentWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> getState() => _SuggestionContentWidgetState();
}

class _SuggestionContentWidgetState
    extends BaseWidgetState<SuggestionContentWidget> {
  @override
  initState() {
    super.initState();
    SuggestionViewModel viewModel = context.read();
    viewModel.feedbackList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SuggestionViewModel>(builder: (
      BuildContext context,
      SuggestionViewModel viewModel,
      Widget? child,
    ) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: ColorUtil.fromHex("#3C4861"),
              height: 40,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 12),
              child: const Text(
                "问题类型",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            InkWell(
              onTap: () async {
                if (viewModel.feedbacks == null) {
                  await viewModel.feedbackList();
                }
                double drawerHeight = ScreenAdaper.getScreenHeight();
                if (viewModel.feedbacks != null) {
                  showFlexibleBottomSheet(
                      context: context,
                      maxHeight: 240 / drawerHeight,
                      initHeight: 240 / drawerHeight,
                      minHeight: 0,
                      builder: (
                        BuildContext context,
                        ScrollController scrollController,
                        double bottomSheetOffset,
                      ) {
                        return FeedbackListBottomDrawer(
                          scrollController,
                          viewModel.feedbacks!,
                          onConfirmed: (feedback) {
                            viewModel.setFeedBack(feedback);
                          },
                        );
                        // return ChangeNotifierProvider<BankDataViewModel>(
                        //     create: (_) => viewModel,
                        //     child: BanklistBottomDrawer(scrollController));
                      });
                } else {
                  onShowToast("获取问题类型失败");
                }
              },
              child: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          viewModel.selectFeedback?.title ?? "请选择问题类型",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Image(
                          image: AssetImage(
                              "assets/images/cstservice/cst_arrow.png"),
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: ColorUtil.fromHex("#3C4861"),
              height: 40,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: const [
                  Text(
                    "问题描述",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    "(内容介于20-200字)",
                    style: TextStyle(fontSize: 12, color: Color(0xff95A4B3)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: (value) {
                  if (value.length > 200) {
                    value = value.substring(0, 200);
                  }
                  viewModel.setSuggestionProblem(value);
                },
                controller: viewModel.suggestionProblemController,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: ColorUtil.fromHex('#EAEBEE'),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "请详细描述您遇到的问题，填写内容不少于20字",
                  contentPadding: const EdgeInsets.all(0),
                  isDense: true,
                  labelStyle: TextStyle(
                    height: 1.4,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: ColorUtil.fromHex('#EAEBEE'),
                  ),
                  hintStyle: TextStyle(
                    height: 1.4,
                    fontSize: 12,
                    color: ColorUtil.fromHex('#848DA4'),
                  ),
                ),
                maxLines: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${viewModel.feedbackDescri?.length ?? 0}/200",
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xff95A4B3)),
                  )
                ],
              ),
            ),
            CommonSubmitButton(
              "提交",
              onPressed: () async {
                bool result = await viewModel.addFeedback();
                if (result) {
                  onShowToast("意见反馈已提交");
                  onBack();
                }
              },
            ),
          ],
        ),
      );
    });
  }
}
