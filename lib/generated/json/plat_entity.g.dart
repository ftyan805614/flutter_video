import 'package:polynesia/generated/json/base/json_convert_content.dart';
import 'package:polynesia/application/data/models/plat_entity.dart';

PlatEntity $PlatEntityFromJson(Map<String, dynamic> json) {
	final PlatEntity platEntity = PlatEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		platEntity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		platEntity.name = name;
	}
	final String? nameZh = jsonConvert.convert<String>(json['nameZh']);
	if (nameZh != null) {
		platEntity.nameZh = nameZh;
	}
	return platEntity;
}

Map<String, dynamic> $PlatEntityToJson(PlatEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['nameZh'] = entity.nameZh;
	return data;
}