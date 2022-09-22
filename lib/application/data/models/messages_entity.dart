import 'package:polynesia/generated/json/base/json_field.dart';
import 'package:polynesia/generated/json/messages_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class MessagesEntity {
  int? current;
  List<MsgEntity>? list;
  int? pages;
  int? size;
  int? total;

  MessagesEntity();

  factory MessagesEntity.fromJson(Map<String, dynamic> json) =>
      $MessagesEntityFromJson(json);

  Map<String, dynamic> toJson() => $MessagesEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MsgEntity {
  int? id;
  String? title;
  String? content;
  String? uids;
  int? category;
  int? createdAt;
  bool selected = false;

  MsgEntity();

  factory MsgEntity.fromJson(Map<String, dynamic> json) =>
      $MsgEntityFromJson(json);

  Map<String, dynamic> toJson() => $MsgEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
