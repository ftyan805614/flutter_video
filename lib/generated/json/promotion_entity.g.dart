import 'package:polynesia/generated/json/base/json_convert_content.dart';
import 'package:polynesia/application/data/models/promotion_entity.dart';

PromotionEntity $PromotionEntityFromJson(Map<String, dynamic> json) {
  final PromotionEntity promotionEntity = PromotionEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    promotionEntity.id = id;
  }
  final String? codeZh = jsonConvert.convert<String>(json['codeZh']);
  if (codeZh != null) {
    promotionEntity.codeZh = codeZh;
  }
  final List<PromotionPromotionsResDto>? promotionsResDtoList =
      jsonConvert.convertListNotNull<PromotionPromotionsResDto>(json['promotionsResDtoList']);
  if (promotionsResDtoList != null) {
    promotionEntity.promotionsResDtoList = promotionsResDtoList;
  }
  return promotionEntity;
}

Map<String, dynamic> $PromotionEntityToJson(PromotionEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['codeZh'] = entity.codeZh;
  data['promotionsResDtoList'] = entity.promotionsResDtoList?.map((v) => v.toJson()).toList();
  return data;
}

PromotionPromotionsResDto $PromotionPromotionsResDtoFromJson(Map<String, dynamic> json) {
  final PromotionPromotionsResDto promotionPromotionsResDto = PromotionPromotionsResDto();
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    promotionPromotionsResDto.code = code;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    promotionPromotionsResDto.id = id;
  }
  final String? img = jsonConvert.convert<String>(json['img']);
  if (img != null) {
    promotionPromotionsResDto.img = img;
  }
  final int? endedAt = jsonConvert.convert<int>(json['endedAt']);
  if (endedAt != null) {
    promotionPromotionsResDto.endedAt = endedAt;
  }
  final int? category = jsonConvert.convert<int>(json['category']);
  if (category != null) {
    promotionPromotionsResDto.category = category;
  }
  final int? startedAt = jsonConvert.convert<int>(json['startedAt']);
  if (startedAt != null) {
    promotionPromotionsResDto.startedAt = startedAt;
  }
  return promotionPromotionsResDto;
}

Map<String, dynamic> $PromotionPromotionsResDtoToJson(PromotionPromotionsResDto entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['id'] = entity.id;
  data['img'] = entity.img;
  data['endedAt'] = entity.endedAt;
  data['category'] = entity.category;
  data['startedAt'] = entity.startedAt;
  return data;
}
