import 'package:polynesia/generated/json/base/json_field.dart';
import 'package:polynesia/generated/json/sign_config_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class SignConfigEntity {

	String? wsServer;
	String? download;
	int? registerInviteCode;
	String? verificationOfGoogle;
	String? loginType;
	String? sms;
	List<String>? lang;
	String? title;
	int? registerMobile;
	String? staticServer;
	String? downloadShow;
	int? registerVerificationCode;
  
  SignConfigEntity();

  factory SignConfigEntity.fromJson(Map<String, dynamic> json) => $SignConfigEntityFromJson(json);

  Map<String, dynamic> toJson() => $SignConfigEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}