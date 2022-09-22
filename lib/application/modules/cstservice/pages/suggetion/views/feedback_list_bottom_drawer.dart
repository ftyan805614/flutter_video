import 'package:flutter/material.dart';
import 'package:polynesia/application/common/utils/color_util.dart';
import 'package:polynesia/application/data/index.dart';
import 'package:polynesia/application/modules/components/index.dart';

class FeedbackListBottomDrawer extends BaseWidget {
  final Function(MsgEntity)? onConfirmed;
  final ScrollController scrollController;
  final List<MsgEntity> feedbacks;
  final MsgEntity? selectFeedback;

  const FeedbackListBottomDrawer(this.scrollController, this.feedbacks,
      {Key? key, this.onConfirmed, this.selectFeedback})
      : super(key: key);

  @override
  State<StatefulWidget> getState() => _FeedbackListBottomDrawerState();
}

class _FeedbackListBottomDrawerState extends BaseWidgetState<FeedbackListBottomDrawer> {
  MsgEntity? _selectFeedback;
  List<MsgEntity>? feedbacks;

  @override
  initState() {
    super.initState();
    feedbacks = widget.feedbacks;

    _selectFeedback = widget.selectFeedback ?? widget.feedbacks[0];
    print("length=${widget.feedbacks.length}");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          _topHeader(),
          _bankListView(context),
        ],
      ),
    );
  }

  _topHeader() {
    return Container(
      color: ColorUtil.fromHex("#EAEBEE"),
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onBack,
              child: Text(
                "取消",
                style: TextStyle(fontSize: 16, color: TColor.bottomTitleColor),
              ),
            ),
            Text(
              "所属银行",
              style:
                  TextStyle(fontSize: 16, color: ColorUtil.fromHex("#1C263D")),
            ),
            InkWell(
              onTap: () {
                if (widget.onConfirmed != null && _selectFeedback != null) {
                  widget.onConfirmed!(_selectFeedback!);
                  onBack();
                }
              },
              child: Text(
                "确定",
                style: TextStyle(
                    fontSize: 16, color: ColorUtil.fromHex("#3C4861")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _bankListView(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          MsgEntity entity = widget.feedbacks[index];
          return InkWell(
            onTap: () {
              feedbacks?.forEach((element) {
                element.selected = false;
              });
              setState(() {
                entity.selected = true;
                _selectFeedback = entity;
                print("onTap ${_selectFeedback?.title}");
                feedbacks = widget.feedbacks;
              });
            },
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: Center(
                child: Text(
                  entity.title ?? "",
                  style: TextStyle(
                      fontSize: 17, color: bankTxtColor(entity, _selectFeedback)),
                ),
              ),
            ),
          );
        },
        // controller: widget.scrollController,
        itemCount: feedbacks!.length,
      ),
    );
  }

  Color bankTxtColor(MsgEntity entity, MsgEntity? selectEntity) {
    if (entity.selected) {
      return ColorUtil.fromHex("#1C263D");
    } else {
      return ColorUtil.fromHex("#95A4B3");
    }
  }
}
