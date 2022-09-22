import 'package:polynesia/generated/json/base/json_convert_content.dart';
import 'package:polynesia/application/data/models/messages_entity.dart';

MessagesEntity $MessagesEntityFromJson(Map<String, dynamic> json) {
	final MessagesEntity messagesEntity = MessagesEntity();
	final int? current = jsonConvert.convert<int>(json['current']);
	if (current != null) {
		messagesEntity.current = current;
	}
	final List<MsgEntity>? list = jsonConvert.convertListNotNull<MsgEntity>(json['list']);
	if (list != null) {
		messagesEntity.list = list;
	}
	final int? pages = jsonConvert.convert<int>(json['pages']);
	if (pages != null) {
		messagesEntity.pages = pages;
	}
	final int? size = jsonConvert.convert<int>(json['size']);
	if (size != null) {
		messagesEntity.size = size;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		messagesEntity.total = total;
	}
	return messagesEntity;
}

Map<String, dynamic> $MessagesEntityToJson(MessagesEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['current'] = entity.current;
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	data['pages'] = entity.pages;
	data['size'] = entity.size;
	data['total'] = entity.total;
	return data;
}

MsgEntity $MsgEntityFromJson(Map<String, dynamic> json) {
	final MsgEntity msgEntity = MsgEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		msgEntity.id = id;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		msgEntity.title = title;
	}
	final String? content = jsonConvert.convert<String>(json['content']);
	if (content != null) {
		msgEntity.content = content;
	}
	final String? uids = jsonConvert.convert<String>(json['uids']);
	if (uids != null) {
		msgEntity.uids = uids;
	}
	final int? category = jsonConvert.convert<int>(json['category']);
	if (category != null) {
		msgEntity.category = category;
	}
	final int? createdAt = jsonConvert.convert<int>(json['createdAt']);
	if (createdAt != null) {
		msgEntity.createdAt = createdAt;
	}
	return msgEntity;
}

Map<String, dynamic> $MsgEntityToJson(MsgEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['content'] = entity.content;
	data['uids'] = entity.uids;
	data['category'] = entity.category;
	data['createdAt'] = entity.createdAt;
	return data;
}