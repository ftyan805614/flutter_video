import 'package:polynesia/generated/json/base/json_field.dart';
import 'package:polynesia/generated/json/promotion_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PromotionEntity {
  int? id;
  String? codeZh;
  List<PromotionPromotionsResDto>? promotionsResDtoList;

  PromotionEntity();

  factory PromotionEntity.fromJson(Map<String, dynamic> json) => $PromotionEntityFromJson(json);

  Map<String, dynamic> toJson() => $PromotionEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PromotionPromotionsResDto {
  String? code;
  int? id;
  String? img;
  int? endedAt;
  int? category;
  int? startedAt;

  PromotionPromotionsResDto();

  factory PromotionPromotionsResDto.fromJson(Map<String, dynamic> json) => $PromotionPromotionsResDtoFromJson(json);

  Map<String, dynamic> toJson() => $PromotionPromotionsResDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
