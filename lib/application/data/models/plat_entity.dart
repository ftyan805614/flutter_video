import 'package:polynesia/generated/json/base/json_field.dart';
import 'package:polynesia/generated/json/plat_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PlatEntity {

	int? id;
	String? name;
	String? nameZh;
  int? groupId;
  String? icon;
  
  PlatEntity();

  factory PlatEntity.fromJson(Map<String, dynamic> json) => $PlatEntityFromJson(json);

  Map<String, dynamic> toJson() => $PlatEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}