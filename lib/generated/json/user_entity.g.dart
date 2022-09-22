import 'package:polynesia/generated/json/base/json_convert_content.dart';
import 'package:polynesia/application/data/models/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final String? fcoin = jsonConvert.convert<String>(json['fcoin']);
	if (fcoin != null) {
		userEntity.fcoin = fcoin;
	}
	final String? passwordCoin = jsonConvert.convert<String>(json['passwordCoin']);
	if (passwordCoin != null) {
		userEntity.passwordCoin = passwordCoin;
	}
	final int? levelId = jsonConvert.convert<int>(json['levelId']);
	if (levelId != null) {
		userEntity.levelId = levelId;
	}
	final String? birthday = jsonConvert.convert<String>(json['birthday']);
	if (birthday != null) {
		userEntity.birthday = birthday;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		userEntity.status = status;
	}
	final int? promoCode = jsonConvert.convert<int>(json['promoCode']);
	if (promoCode != null) {
		userEntity.promoCode = promoCode;
	}
	final dynamic? upgradeBalance = jsonConvert.convert<dynamic>(json['upgradeBalance']);
	if (upgradeBalance != null) {
		userEntity.upgradeBalance = upgradeBalance;
	}
	final int? sex = jsonConvert.convert<int>(json['sex']);
	if (sex != null) {
		userEntity.sex = sex;
	}
	final int? score = jsonConvert.convert<int>(json['score']);
	if (score != null) {
		userEntity.score = score;
	}
	final int? createdAt = jsonConvert.convert<int>(json['createdAt']);
	if (createdAt != null) {
		userEntity.createdAt = createdAt;
	}
	final String? signature = jsonConvert.convert<String>(json['signature']);
	if (signature != null) {
		userEntity.signature = signature;
	}
	final String? realname = jsonConvert.convert<String>(json['realname']);
	if (realname != null) {
		userEntity.realname = realname;
	}
	final String? passwordHash = jsonConvert.convert<String>(json['passwordHash']);
	if (passwordHash != null) {
		userEntity.passwordHash = passwordHash;
	}
	final int? autoTransfer = jsonConvert.convert<int>(json['autoTransfer']);
	if (autoTransfer != null) {
		userEntity.autoTransfer = autoTransfer;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userEntity.id = id;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userEntity.email = email;
	}
	final String? coin = jsonConvert.convert<String>(json['coin']);
	if (coin != null) {
		userEntity.coin = coin;
	}
	final String? mobile = jsonConvert.convert<String>(json['mobile']);
	if (mobile != null) {
		userEntity.mobile = mobile;
	}
	final String? avatar = jsonConvert.convert<String>(json['avatar']);
	if (avatar != null) {
		userEntity.avatar = avatar;
	}
	final int? role = jsonConvert.convert<int>(json['role']);
	if (role != null) {
		userEntity.role = role;
	}
	final int? bindBank = jsonConvert.convert<int>(json['bindBank']);
	if (bindBank != null) {
		userEntity.bindBank = bindBank;
	}
	final String? apiToken = jsonConvert.convert<String>(json['apiToken']);
	if (apiToken != null) {
		userEntity.apiToken = apiToken;
	}
	final String? areaCode = jsonConvert.convert<String>(json['areaCode']);
	if (areaCode != null) {
		userEntity.areaCode = areaCode;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		userEntity.address = address;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		userEntity.username = username;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['fcoin'] = entity.fcoin;
	data['passwordCoin'] = entity.passwordCoin;
	data['levelId'] = entity.levelId;
	data['birthday'] = entity.birthday;
	data['status'] = entity.status;
	data['promoCode'] = entity.promoCode;
	data['upgradeBalance'] = entity.upgradeBalance;
	data['sex'] = entity.sex;
	data['score'] = entity.score;
	data['createdAt'] = entity.createdAt;
	data['signature'] = entity.signature;
	data['realname'] = entity.realname;
	data['passwordHash'] = entity.passwordHash;
	data['autoTransfer'] = entity.autoTransfer;
	data['id'] = entity.id;
	data['email'] = entity.email;
	data['coin'] = entity.coin;
	data['mobile'] = entity.mobile;
	data['avatar'] = entity.avatar;
	data['role'] = entity.role;
	data['bindBank'] = entity.bindBank;
	data['apiToken'] = entity.apiToken;
	data['areaCode'] = entity.areaCode;
	data['address'] = entity.address;
	data['username'] = entity.username;
	return data;
}