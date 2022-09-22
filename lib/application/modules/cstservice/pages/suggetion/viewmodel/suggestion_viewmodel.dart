import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polynesia/application/data/apis/plat_api.dart';
import 'package:polynesia/application/data/index.dart';
import 'package:polynesia/application/modules/components/index.dart';

import '../../../../../constants/app_exception.dart';

class SuggestionViewModel extends BaseViewModel {
  MsgEntity? selectFeedback;

  String? feedbackDescri;

  List<MsgEntity>? feedbacks;

  TextEditingController get suggestionProblemController =>
      TextEditingController(text: feedbackDescri);

  setSuggestionProblem(String value) {
    feedbackDescri = value;
    notifyListeners();
  }

  setFeedBack(MsgEntity value) {
    selectFeedback = value;
    notifyListeners();
  }

  feedbackList() async {
    try {
      onShowLoading();
      List<MsgEntity> result =
          await APIService.api().post(PlatAPI.listCategory());
      if (result.isEmpty) {
        feedbacks = _initLocalFeedback();
      } else {
        feedbacks = result;
      }
      notifyListeners();
      onHiddenToast();
    } catch (e) {
      onHiddenToast();
      print(e);
    }
  }

  Future<bool> addFeedback() async {
    if (selectFeedback == null) {
      onShowToast("请选择问题类型");
      return false;
    }
    if (feedbackDescri == null || feedbackDescri!.length < 20) {
      onShowToast("问题描述必须介于20-200字哦");
      return false;
    }
    try {
      onShowLoading();
      Map<String, dynamic> params = {
        "category": selectFeedback?.id,
        "content": feedbackDescri,
      };
      bool result = await APIService.api().post(PlatAPI.addFeedback(params));
      notifyListeners();
      onHiddenToast();
      return result;
    } on AppException catch (e) {
      onShowToast(e.getMessage());
    } catch (e) {
      onHiddenToast();
      print(e);
    }
    return false;
  }

  _initLocalFeedback() {
    List<MsgEntity> list = [];
    MsgEntity entity = MsgEntity();
    entity.id = 1;
    entity.title = "充值问题";
    list.add(entity);
    return list;
  }
}
