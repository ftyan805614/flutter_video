import 'package:polynesia/generated/json/base/json_convert_content.dart';
import 'package:polynesia/application/data/models/config_entity.dart';

ConfigEntity $ConfigEntityFromJson(Map<String, dynamic> json) {
	final ConfigEntity configEntity = ConfigEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		configEntity.id = id;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		configEntity.title = title;
	}
	final String? titleZh = jsonConvert.convert<String>(json['titleZh']);
	if (titleZh != null) {
		configEntity.titleZh = titleZh;
	}
	final String? value = jsonConvert.convert<String>(json['value']);
	if (value != null) {
		configEntity.value = value;
	}
	return configEntity;
}

Map<String, dynamic> $ConfigEntityToJson(ConfigEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['titleZh'] = entity.titleZh;
	data['value'] = entity.value;
	return data;
}