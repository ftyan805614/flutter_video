class VipLevelInfoEntity {
  int? id;
  String? code;
  String? name;
  String? scoreUpgrade;
  String? currentFlow;
  String? scoreRelegation;
  String? rewardsUpgrade;
  String? rewardsMonthly;
  String? rewardsBirthday;
  int? withdrawalNums;
  int? withdrawalTotalCoin;

  VipLevelInfoEntity(
      {this.id,
        this.code,
        this.name,
        this.scoreUpgrade,
        this.currentFlow,
        this.scoreRelegation,
        this.rewardsUpgrade,
        this.rewardsMonthly,
        this.rewardsBirthday,
        this.withdrawalNums,
        this.withdrawalTotalCoin});

  VipLevelInfoEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    scoreUpgrade = json['scoreUpgrade'];
    currentFlow = json['currentFlow'];
    scoreRelegation = json['scoreRelegation'];
    rewardsUpgrade = json['rewardsUpgrade'];
    rewardsMonthly = json['rewardsMonthly'];
    rewardsBirthday = json['rewardsBirthday'];
    withdrawalNums = json['withdrawalNums'];
    withdrawalTotalCoin = json['withdrawalTotalCoin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['scoreUpgrade'] = this.scoreUpgrade;
    data['currentFlow'] = this.currentFlow;
    data['scoreRelegation'] = this.scoreRelegation;
    data['rewardsUpgrade'] = this.rewardsUpgrade;
    data['rewardsMonthly'] = this.rewardsMonthly;
    data['rewardsBirthday'] = this.rewardsBirthday;
    data['withdrawalNums'] = this.withdrawalNums;
    data['withdrawalTotalCoin'] = this.withdrawalTotalCoin;
    return data;
  }
}
