import 'package:polynesia/generated/json/base/json_convert_content.dart';
import 'package:polynesia/application/data/models/sign_config_entity.dart';

SignConfigEntity $SignConfigEntityFromJson(Map<String, dynamic> json) {
	final SignConfigEntity signConfigEntity = SignConfigEntity();
	final String? wsServer = jsonConvert.convert<String>(json['wsServer']);
	if (wsServer != null) {
		signConfigEntity.wsServer = wsServer;
	}
	final String? download = jsonConvert.convert<String>(json['download']);
	if (download != null) {
		signConfigEntity.download = download;
	}
	final int? registerInviteCode = jsonConvert.convert<int>(json['registerInviteCode']);
	if (registerInviteCode != null) {
		signConfigEntity.registerInviteCode = registerInviteCode;
	}
	final String? verificationOfGoogle = jsonConvert.convert<String>(json['verificationOfGoogle']);
	if (verificationOfGoogle != null) {
		signConfigEntity.verificationOfGoogle = verificationOfGoogle;
	}
	final String? loginType = jsonConvert.convert<String>(json['loginType']);
	if (loginType != null) {
		signConfigEntity.loginType = loginType;
	}
	final String? sms = jsonConvert.convert<String>(json['sms']);
	if (sms != null) {
		signConfigEntity.sms = sms;
	}
	final List<String>? lang = jsonConvert.convertListNotNull<String>(json['lang']);
	if (lang != null) {
		signConfigEntity.lang = lang;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		signConfigEntity.title = title;
	}
	final int? registerMobile = jsonConvert.convert<int>(json['registerMobile']);
	if (registerMobile != null) {
		signConfigEntity.registerMobile = registerMobile;
	}
	final String? staticServer = jsonConvert.convert<String>(json['staticServer']);
	if (staticServer != null) {
		signConfigEntity.staticServer = staticServer;
	}
	final String? downloadShow = jsonConvert.convert<String>(json['downloadShow']);
	if (downloadShow != null) {
		signConfigEntity.downloadShow = downloadShow;
	}
	final int? registerVerificationCode = jsonConvert.convert<int>(json['registerVerificationCode']);
	if (registerVerificationCode != null) {
		signConfigEntity.registerVerificationCode = registerVerificationCode;
	}
	return signConfigEntity;
}

Map<String, dynamic> $SignConfigEntityToJson(SignConfigEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['wsServer'] = entity.wsServer;
	data['download'] = entity.download;
	data['registerInviteCode'] = entity.registerInviteCode;
	data['verificationOfGoogle'] = entity.verificationOfGoogle;
	data['loginType'] = entity.loginType;
	data['sms'] = entity.sms;
	data['lang'] =  entity.lang;
	data['title'] = entity.title;
	data['registerMobile'] = entity.registerMobile;
	data['staticServer'] = entity.staticServer;
	data['downloadShow'] = entity.downloadShow;
	data['registerVerificationCode'] = entity.registerVerificationCode;
	return data;
}