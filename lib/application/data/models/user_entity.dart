import 'package:polynesia/generated/json/base/json_field.dart';
import 'package:polynesia/generated/json/user_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserEntity {
  String? fcoin;
  String? passwordCoin;
  int? levelId;
  String? birthday;
  int? status;
  int? promoCode;
  dynamic upgradeBalance;
  int? sex;
  int? score;
  int? createdAt;
  String? signature;
  String? realname;
  String? passwordHash;
  int? autoTransfer;
  int? id;
  String? email;
  String? coin;
  String? mobile;
  String? avatar;
  int? role;
  int? bindBank;
  String? apiToken;
  String? areaCode;
  String? address;
  String? username;

  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
