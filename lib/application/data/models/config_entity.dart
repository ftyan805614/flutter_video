import 'package:polynesia/generated/json/base/json_field.dart';
import 'package:polynesia/generated/json/config_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ConfigEntity {

	int? id;
	String? title;
	String? titleZh;
	String? value;
  
  ConfigEntity();

  factory ConfigEntity.fromJson(Map<String, dynamic> json) => $ConfigEntityFromJson(json);

  Map<String, dynamic> toJson() => $ConfigEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}