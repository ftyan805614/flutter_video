import 'package:polynesia/generated/json/base/json_convert_content.dart';
import 'package:polynesia/application/data/models/user_detail_entity.dart';

UserDetailEntity $UserDetailEntityFromJson(Map<String, dynamic> json) {
	final UserDetailEntity userDetailEntity = UserDetailEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userDetailEntity.id = id;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		userDetailEntity.username = username;
	}
	final String? avatar = jsonConvert.convert<String>(json['avatar']);
	if (avatar != null) {
		userDetailEntity.avatar = avatar;
	}
	final String? coin = jsonConvert.convert<String>(json['coin']);
	if (coin != null) {
		userDetailEntity.coin = coin;
	}
	final String? fcoin = jsonConvert.convert<String>(json['fcoin']);
	if (fcoin != null) {
		userDetailEntity.fcoin = fcoin;
	}
	final int? levelId = jsonConvert.convert<int>(json['levelId']);
	if (levelId != null) {
		userDetailEntity.levelId = levelId;
	}
	final String? realname = jsonConvert.convert<String>(json['realname']);
	if (realname != null) {
		userDetailEntity.realname = realname;
	}
	final String? signature = jsonConvert.convert<String>(json['signature']);
	if (signature != null) {
		userDetailEntity.signature = signature;
	}
	final dynamic? birthday = jsonConvert.convert<dynamic>(json['birthday']);
	if (birthday != null) {
		userDetailEntity.birthday = birthday;
	}
	final String? areaCode = jsonConvert.convert<String>(json['areaCode']);
	if (areaCode != null) {
		userDetailEntity.areaCode = areaCode;
	}
	final String? mobile = jsonConvert.convert<String>(json['mobile']);
	if (mobile != null) {
		userDetailEntity.mobile = mobile;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userDetailEntity.email = email;
	}
	final int? sex = jsonConvert.convert<int>(json['sex']);
	if (sex != null) {
		userDetailEntity.sex = sex;
	}
	final int? role = jsonConvert.convert<int>(json['role']);
	if (role != null) {
		userDetailEntity.role = role;
	}
	final int? autoTransfer = jsonConvert.convert<int>(json['autoTransfer']);
	if (autoTransfer != null) {
		userDetailEntity.autoTransfer = autoTransfer;
	}
	final int? bindBank = jsonConvert.convert<int>(json['bindBank']);
	if (bindBank != null) {
		userDetailEntity.bindBank = bindBank;
	}
	final int? score = jsonConvert.convert<int>(json['score']);
	if (score != null) {
		userDetailEntity.score = score;
	}
	final int? promoCode = jsonConvert.convert<int>(json['promoCode']);
	if (promoCode != null) {
		userDetailEntity.promoCode = promoCode;
	}
	final dynamic? apiToken = jsonConvert.convert<dynamic>(json['apiToken']);
	if (apiToken != null) {
		userDetailEntity.apiToken = apiToken;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		userDetailEntity.address = address;
	}
	final String? passwordHash = jsonConvert.convert<String>(json['passwordHash']);
	if (passwordHash != null) {
		userDetailEntity.passwordHash = passwordHash;
	}
	final String? passwordCoin = jsonConvert.convert<String>(json['passwordCoin']);
	if (passwordCoin != null) {
		userDetailEntity.passwordCoin = passwordCoin;
	}
	final int? createdAt = jsonConvert.convert<int>(json['createdAt']);
	if (createdAt != null) {
		userDetailEntity.createdAt = createdAt;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		userDetailEntity.status = status;
	}
	final String? upgradeBalance = jsonConvert.convert<String>(json['upgradeBalance']);
	if (upgradeBalance != null) {
		userDetailEntity.upgradeBalance = upgradeBalance;
	}
	return userDetailEntity;
}

Map<String, dynamic> $UserDetailEntityToJson(UserDetailEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['username'] = entity.username;
	data['avatar'] = entity.avatar;
	data['coin'] = entity.coin;
	data['fcoin'] = entity.fcoin;
	data['levelId'] = entity.levelId;
	data['realname'] = entity.realname;
	data['signature'] = entity.signature;
	data['birthday'] = entity.birthday;
	data['areaCode'] = entity.areaCode;
	data['mobile'] = entity.mobile;
	data['email'] = entity.email;
	data['sex'] = entity.sex;
	data['role'] = entity.role;
	data['autoTransfer'] = entity.autoTransfer;
	data['bindBank'] = entity.bindBank;
	data['score'] = entity.score;
	data['promoCode'] = entity.promoCode;
	data['apiToken'] = entity.apiToken;
	data['address'] = entity.address;
	data['passwordHash'] = entity.passwordHash;
	data['passwordCoin'] = entity.passwordCoin;
	data['createdAt'] = entity.createdAt;
	data['status'] = entity.status;
	data['upgradeBalance'] = entity.upgradeBalance;
	return data;
}