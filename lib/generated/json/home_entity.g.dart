import 'package:polynesia/generated/json/base/json_convert_content.dart';
import 'package:polynesia/application/data/models/home_entity.dart';

HomeEntity $HomeEntityFromJson(Map<String, dynamic> json) {
  final HomeEntity homeEntity = HomeEntity();
  final List<HomeGame>? game = jsonConvert.convertListNotNull<HomeGame>(json['game']);
  if (game != null) {
    homeEntity.game = game;
  }
  final List<HomeBanner>? banner = jsonConvert.convertListNotNull<HomeBanner>(json['banner']);
  if (banner != null) {
    homeEntity.banner = banner;
  }
  final HomeNotice? notice = jsonConvert.convert<HomeNotice>(json['notice']);
  if (notice != null) {
    homeEntity.notice = notice;
  }
  final HomeMatchPreview? matchPreview = jsonConvert.convert<HomeMatchPreview>(json['matchPreview']);
  if (matchPreview != null) {
    homeEntity.matchPreview = matchPreview;
  }
  return homeEntity;
}

Map<String, dynamic> $HomeEntityToJson(HomeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['game'] = entity.game?.map((v) => v.toJson()).toList();
  data['banner'] = entity.banner?.map((v) => v.toJson()).toList();
  data['notice'] = entity.notice?.toJson();
  data['matchPreview'] = entity.matchPreview?.toJson();
  return data;
}

HomeGame $HomeGameFromJson(Map<String, dynamic> json) {
  final HomeGame homeGame = HomeGame();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeGame.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    homeGame.name = name;
  }
  final String? nameAbbr = jsonConvert.convert<String>(json['nameAbbr']);
  if (nameAbbr != null) {
    homeGame.nameAbbr = nameAbbr;
  }
  final String? rebate = jsonConvert.convert<String>(json['rebate']);
  if (rebate != null) {
    homeGame.rebate = rebate;
  }
  final List<HomeGameList>? list = jsonConvert.convertListNotNull<HomeGameList>(json['list']);
  if (list != null) {
    homeGame.list = list;
  }
  return homeGame;
}

Map<String, dynamic> $HomeGameToJson(HomeGame entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['nameAbbr'] = entity.nameAbbr;
  data['rebate'] = entity.rebate;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

HomeGameList $HomeGameListFromJson(Map<String, dynamic> json) {
  final HomeGameList homeGameList = HomeGameList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeGameList.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    homeGameList.name = name;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    homeGameList.status = status;
  }
  final HomeGameListMaintenance? maintenance = jsonConvert.convert<HomeGameListMaintenance>(json['maintenance']);
  if (maintenance != null) {
    homeGameList.maintenance = maintenance;
  }
  final bool? supportIframe = jsonConvert.convert<bool>(json['supportIframe']);
  if (supportIframe != null) {
    homeGameList.supportIframe = supportIframe;
  }
  return homeGameList;
}

Map<String, dynamic> $HomeGameListToJson(HomeGameList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['status'] = entity.status;
  data['maintenance'] = entity.maintenance?.toJson();
  data['supportIframe'] = entity.supportIframe;
  return data;
}

HomeGameListMaintenance $HomeGameListMaintenanceFromJson(Map<String, dynamic> json) {
  final HomeGameListMaintenance homeGameListMaintenance = HomeGameListMaintenance();
  return homeGameListMaintenance;
}

Map<String, dynamic> $HomeGameListMaintenanceToJson(HomeGameListMaintenance entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

HomeBanner $HomeBannerFromJson(Map<String, dynamic> json) {
  final HomeBanner homeBanner = HomeBanner();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeBanner.id = id;
  }
  final String? img = jsonConvert.convert<String>(json['img']);
  if (img != null) {
    homeBanner.img = img;
  }
  final String? href = jsonConvert.convert<String>(json['href']);
  if (href != null) {
    homeBanner.href = href;
  }
  return homeBanner;
}

Map<String, dynamic> $HomeBannerToJson(HomeBanner entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['img'] = entity.img;
  data['href'] = entity.href;
  return data;
}

HomeNotice $HomeNoticeFromJson(Map<String, dynamic> json) {
  final HomeNotice homeNotice = HomeNotice();
  final String? current = jsonConvert.convert<String>(json['current']);
  if (current != null) {
    homeNotice.current = current;
  }
  final String? size = jsonConvert.convert<String>(json['size']);
  if (size != null) {
    homeNotice.size = size;
  }
  final List<HomeNoticeList>? list = jsonConvert.convertListNotNull<HomeNoticeList>(json['list']);
  if (list != null) {
    homeNotice.list = list;
  }
  final String? total = jsonConvert.convert<String>(json['total']);
  if (total != null) {
    homeNotice.total = total;
  }
  final String? pages = jsonConvert.convert<String>(json['pages']);
  if (pages != null) {
    homeNotice.pages = pages;
  }
  return homeNotice;
}

Map<String, dynamic> $HomeNoticeToJson(HomeNotice entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['current'] = entity.current;
  data['size'] = entity.size;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['pages'] = entity.pages;
  return data;
}

HomeNoticeList $HomeNoticeListFromJson(Map<String, dynamic> json) {
  final HomeNoticeList homeNoticeList = HomeNoticeList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    homeNoticeList.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    homeNoticeList.title = title;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    homeNoticeList.content = content;
  }
  final dynamic? uids = jsonConvert.convert<dynamic>(json['uids']);
  if (uids != null) {
    homeNoticeList.uids = uids;
  }
  final int? category = jsonConvert.convert<int>(json['category']);
  if (category != null) {
    homeNoticeList.category = category;
  }
  final int? createdAt = jsonConvert.convert<int>(json['createdAt']);
  if (createdAt != null) {
    homeNoticeList.createdAt = createdAt;
  }
  return homeNoticeList;
}

Map<String, dynamic> $HomeNoticeListToJson(HomeNoticeList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['content'] = entity.content;
  data['uids'] = entity.uids;
  data['category'] = entity.category;
  data['createdAt'] = entity.createdAt;
  return data;
}

HomeMatchPreview $HomeMatchPreviewFromJson(Map<String, dynamic> json) {
  final HomeMatchPreview homeMatchPreview = HomeMatchPreview();
  final String? current = jsonConvert.convert<String>(json['current']);
  if (current != null) {
    homeMatchPreview.current = current;
  }
  final String? size = jsonConvert.convert<String>(json['size']);
  if (size != null) {
    homeMatchPreview.size = size;
  }
  final List<dynamic>? list = jsonConvert.convertListNotNull<dynamic>(json['list']);
  if (list != null) {
    homeMatchPreview.list = list;
  }
  final String? total = jsonConvert.convert<String>(json['total']);
  if (total != null) {
    homeMatchPreview.total = total;
  }
  final String? pages = jsonConvert.convert<String>(json['pages']);
  if (pages != null) {
    homeMatchPreview.pages = pages;
  }
  return homeMatchPreview;
}

Map<String, dynamic> $HomeMatchPreviewToJson(HomeMatchPreview entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['current'] = entity.current;
  data['size'] = entity.size;
  data['list'] = entity.list;
  data['total'] = entity.total;
  data['pages'] = entity.pages;
  return data;
}
