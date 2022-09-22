class LevelRebateEntity {
  int? levelId;
  String? sports;
  String? livesGame;
  String? finishGame;
  String? chess;
  String? egames;
  String? esports;

  LevelRebateEntity(
      {this.levelId,
        this.sports,
        this.livesGame,
        this.finishGame,
        this.chess,
        this.egames,
        this.esports});

  LevelRebateEntity.fromJson(Map<String, dynamic> json) {
    levelId = json['levelId'];
    sports = json['sports'];
    livesGame = json['livesGame'];
    finishGame = json['finishGame'];
    chess = json['chess'];
    egames = json['egames'];
    esports = json['esports'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['levelId'] = this.levelId;
    data['sports'] = this.sports;
    data['livesGame'] = this.livesGame;
    data['finishGame'] = this.finishGame;
    data['chess'] = this.chess;
    data['egames'] = this.egames;
    data['esports'] = this.esports;
    return data;
  }
}
