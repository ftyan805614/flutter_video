import 'package:polynesia/generated/json/base/json_field.dart';
import 'package:polynesia/generated/json/user_detail_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserDetailEntity {

	int? id;
	String? username;
	String? avatar;
	String? coin;
	String? fcoin;
	int? levelId;
	String? realname;
	String? signature;
	dynamic birthday;
	String? areaCode;
	String? mobile;
	String? email;
	int? sex;
	int? role;
	int? autoTransfer;
	int? bindBank;
	int? score;
	int? promoCode;
	dynamic apiToken;
	String? address;
	String? passwordHash;
	String? passwordCoin;
	int? createdAt;
	int? status;
	String? upgradeBalance;
  
  UserDetailEntity();

  factory UserDetailEntity.fromJson(Map<String, dynamic> json) => $UserDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}