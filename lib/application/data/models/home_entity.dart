import 'package:polynesia/generated/json/base/json_field.dart';
import 'package:polynesia/generated/json/home_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class HomeEntity {
  List<HomeGame>? game;
  List<HomeBanner>? banner;
  HomeNotice? notice;
  HomeMatchPreview? matchPreview;

  HomeEntity();

  factory HomeEntity.fromJson(Map<String, dynamic> json) => $HomeEntityFromJson(json);

  Map<String, dynamic> toJson() => $HomeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeGame {
  int? id;
  String? name;
  String? nameAbbr;
  String? rebate;
  List<HomeGameList>? list;

  HomeGame();

  factory HomeGame.fromJson(Map<String, dynamic> json) => $HomeGameFromJson(json);

  Map<String, dynamic> toJson() => $HomeGameToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeGameList {
  int? id;
  String? name;
  int? status;
  HomeGameListMaintenance? maintenance;
  bool? supportIframe;

  HomeGameList();

  factory HomeGameList.fromJson(Map<String, dynamic> json) => $HomeGameListFromJson(json);

  Map<String, dynamic> toJson() => $HomeGameListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeGameListMaintenance {
  HomeGameListMaintenance();

  factory HomeGameListMaintenance.fromJson(Map<String, dynamic> json) => $HomeGameListMaintenanceFromJson(json);

  Map<String, dynamic> toJson() => $HomeGameListMaintenanceToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeBanner {
  int? id;
  String? img;
  String? href;

  HomeBanner();

  factory HomeBanner.fromJson(Map<String, dynamic> json) => $HomeBannerFromJson(json);

  Map<String, dynamic> toJson() => $HomeBannerToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeNotice {
  String? current;
  String? size;
  List<HomeNoticeList>? list;
  String? total;
  String? pages;

  HomeNotice();

  factory HomeNotice.fromJson(Map<String, dynamic> json) => $HomeNoticeFromJson(json);

  Map<String, dynamic> toJson() => $HomeNoticeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeNoticeList {
  int? id;
  String? title;
  String? content;
  dynamic uids;
  int? category;
  int? createdAt;

  HomeNoticeList();

  factory HomeNoticeList.fromJson(Map<String, dynamic> json) => $HomeNoticeListFromJson(json);

  Map<String, dynamic> toJson() => $HomeNoticeListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class HomeMatchPreview {
  String? current;
  String? size;
  List<dynamic>? list;
  String? total;
  String? pages;

  HomeMatchPreview();

  factory HomeMatchPreview.fromJson(Map<String, dynamic> json) => $HomeMatchPreviewFromJson(json);

  Map<String, dynamic> toJson() => $HomeMatchPreviewToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
