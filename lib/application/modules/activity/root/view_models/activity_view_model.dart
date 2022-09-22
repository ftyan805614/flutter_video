import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/data/index.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/constants/index.dart';

class ActivityViewModel extends BaseViewModel {
  /// 顶部分类
  List<PromotionEntity> promotions = [];
  void setPromotions(List<PromotionEntity> items) {
    promotions = items;
    setState(ViewState.idle);
    notifyListeners();
  }

  /// 页面再次显示
  void onAppear() {
    if (promotions.isEmpty) {
      refreshCategories();
    }
  }

  /// 刷新顶部分类
  Future<void> refreshCategories() async {
    setState(ViewState.busy);
    try {
      onShowLoading();
      List<PromotionEntity> models = await APIService.api().post(ActivityAPI.promotionsList());
      onHiddenToast();
      setPromotions(models);
    } catch (e) {
      Log.d(e.toString());
      if (e is AppException) {
        setException(e);
      } else {
        setException(AppException.customNetwork(e.toString()));
      }
      onShowError(e.toString());
    }
  }

  PromotionEntity getPromotionEntity(int index) {
    return promotions[index];
  }
}
