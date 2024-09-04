import 'dart:convert';

class TravelModel {
  int totalCount;
  List<TravelItem> resultList;

  TravelModel(this.totalCount, this.resultList);

  factory TravelModel.fromJson(Map<String, dynamic> json) {
    int totalCount = json['totalCount'] as int;
    List<TravelItem> resultList = [];

    if (json['resultList'] != null) {
      json['resultList'].foreach((v) {
        resultList.add(TravelItem.fromJson(v as Map<String, dynamic>));
      });
    }
    return TravelModel(totalCount, resultList);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    if (resultList.isNotEmpty) {
      data['resultList'] = resultList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TravelItem {
  int type;
  Article? article;

  TravelItem(this.type, this.article);

  factory TravelItem.fromJson(Map<String, dynamic> json) {
    int type = json['type'] as int;
    Article? article = json['article'] != null
        ? Article.fromJson(json['article'] as Map<String, dynamic>)
        : null;
    return TravelItem(type, article);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (article != null) {
      data['article'] = article!.toJson();
    }
    return data;
  }
}

class Article {
  int articleId;
  String articleType;
  int productType;
  int sourceType;
  String articleTitle;
  Author author;
  List<Images> images;
  bool hasVideo;
  int readCount;
  int likeCount;
  int commentCount;
  List<Urls> urls;
  List<String> tags;
  List<Topics> topics;
  List<Pois> pois;
  String publishTime;
  String publishTimeDisplay;
  String shootTime;
  String shootTimeDisplay;
  int level;
  String distanceText;
  bool isLike;
  int imageCounts;
  bool isCollected;
  int collectCount;
  int articleStatus;
  String poiName;

  Article(
      this.articleId,
      this.articleType,
      this.productType,
      this.sourceType,
      this.articleTitle,
      this.author,
      this.images,
      this.hasVideo,
      this.readCount,
      this.likeCount,
      this.commentCount,
      this.urls,
      this.tags,
      this.topics,
      this.pois,
      this.publishTime,
      this.publishTimeDisplay,
      this.shootTime,
      this.shootTimeDisplay,
      this.level,
      this.distanceText,
      this.isLike,
      this.imageCounts,
      this.isCollected,
      this.collectCount,
      this.articleStatus,
      this.poiName);

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      json['articleId'] as int,
      json['articleType'] as String,
      json['productType'] as int,
      json['sourceType'] as int,
      json['articleTitle'] as String,
      Author.fromJson(json['author'] as Map<String, dynamic>),
      (json['images'] as List<dynamic>)
          .map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['hasVideo'] as bool,
      json['readCount'] as int,
      json['likeCount'] as int,
      json['commentCount'] as int,
      (json['urls'] as List<dynamic>)
          .map((e) => Urls.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['tags'] as List<dynamic>)
          .map((e) => e as String)
          .toList(), // 确保 tags 是字符串列表
      (json['topics'] as List<dynamic>)
          .map((e) => Topics.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['pois'] as List<dynamic>)
          .map((e) => Pois.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['publishTime'] as String,
      json['publishTimeDisplay'] as String,
      json['shootTime'] as String,
      json['shootTimeDisplay'] as String,
      json['level'] as int,
      json['distanceText'] as String,
      json['isLike'] as bool,
      json['imageCounts'] as int,
      json['isCollected'] as bool,
      json['collectCount'] as int,
      json['articleStatus'] as int,
      json['poiName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'articleId': articleId,
      'articleType': articleType,
      'productType': productType,
      'sourceType': sourceType,
      'articleTitle': articleTitle,
      'author': author.toJson(),
      'images': images.map((e) => e.toJson()).toList(),
      'hasVideo': hasVideo,
      'readCount': readCount,
      'likeCount': likeCount,
      'commentCount': commentCount,
      'urls': urls.map((e) => e.toJson()).toList(),
      'tags': tags, // 确保 tags 是非 null 的字符串列表
      'topics': topics.map((e) => e.toJson()).toList(),
      'pois': pois.map((e) => e.toJson()).toList(),
      'publishTime': publishTime,
      'publishTimeDisplay': publishTimeDisplay,
      'shootTime': shootTime,
      'shootTimeDisplay': shootTimeDisplay,
      'level': level,
      'distanceText': distanceText,
      'isLike': isLike,
      'imageCounts': imageCounts,
      'isCollected': isCollected,
      'collectCount': collectCount,
      'articleStatus': articleStatus,
      'poiName': poiName,
    };
  }
}

class Author {
  int authorId;
  String nickName;
  String clientAuth;
  String jumpUrl;
  CoverImage? coverImage;
  int identityType;
  String tag;

  Author(this.authorId, this.nickName, this.clientAuth, this.jumpUrl,
      this.coverImage, this.identityType, this.tag);

  factory Author.fromJson(Map<String, dynamic> json) {
    int authorId = json['authorId'] as int;
    String nickName = json['nickName'] as String;
    String clientAuth = json['clientAuth'] as String;
    String jumpUrl = json['jumpUrl'] as String;
    CoverImage? coverImage = json['coverImage'] != null
        ? CoverImage.fromJson(json['coverImage'])
        : null;
    int identityType = json['identityType'] as int;
    String tag = json['tag'] as String;
    return Author(
        authorId, nickName, clientAuth, jumpUrl, coverImage, identityType, tag);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authorId'] = authorId;
    data['nickName'] = nickName;
    data['clientAuth'] = clientAuth;
    data['jumpUrl'] = jumpUrl;
    if (coverImage != null) {
      data['coverImage'] = coverImage!.toJson();
    }
    data['identityType'] = identityType;
    data['tag'] = tag;
    return data;
  }
}

class CoverImage {
  String dynamicUrl;
  String originalUrl;

  CoverImage(this.dynamicUrl, this.originalUrl);

  factory CoverImage.fromJson(Map<String, dynamic> json) {
    return CoverImage(json['dynamicUrl'], json['originalUrl']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dynamicUrl'] = dynamicUrl;
    data['originalUrl'] = originalUrl;
    return data;
  }
}

class Images {
  int imageId;
  String dynamicUrl;
  String originalUrl;
  double width;
  double height;
  int mediaType;
  bool isWaterMarked;

  Images(this.imageId, this.dynamicUrl, this.originalUrl, this.width,
      this.height, this.mediaType, this.isWaterMarked);

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
        json['imageId'] as int,
        json['dynamicUrl'] as String,
        json['originalUrl'] as String,
        json['width'] as double,
        json['height'] as double,
        json['mediaType'] as int,
        json['isWaterMarked'] as bool);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageId'] = imageId;
    data['dynamicUrl'] = dynamicUrl;
    data['originalUrl'] = originalUrl;
    data['width'] = width;
    data['height'] = height;
    data['mediaType'] = mediaType;
    data['isWaterMarked'] = isWaterMarked;
    return data;
  }
}

class Urls {
  String version;
  String appUrl;
  String h5Url;
  String wxUrl;

  Urls(this.version, this.appUrl, this.h5Url, this.wxUrl);

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(json['version'] as String, json['appUrl'] as String,
        json['h5Url'] as String, json['wxUrl'] as String);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['appUrl'] = appUrl;
    data['h5Url'] = h5Url;
    data['wxUrl'] = wxUrl;
    return data;
  }
}

class Topics {
  int topicId;
  String topicName;
  int level;

  Topics(this.topicId, this.topicName, this.level);

  factory Topics.fromJson(Map<String, dynamic> json) {
    return Topics(json['topicId'] as int, json['topicName'] as String,
        json['level'] as int);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['topicId'] = topicId;
    data['topicName'] = topicName;
    data['level'] = level;
    return data;
  }
}

class Pois {
  int poiType;
  int poiId;
  String poiName;
  int businessId;
  int districtId;
  PoiExt? poiExt;
  int source;
  int isMain;
  bool isInChina;
  String countryName;

  Pois(this.poiType, this.poiId, this.poiName, this.businessId, this.districtId,
      this.poiExt, this.source, this.isMain, this.isInChina, this.countryName);

  factory Pois.fromJson(Map<String, dynamic> json) {
    int poiType = json['poiType'] as int;
    int poiId = json['poiId'] as int;
    String poiName = json['poiName'] as String;
    int businessId = json['businessId'] as int;
    int districtId = json['districtId'] as int;
    PoiExt? poiExt = json['poiExt'] != null
        ? PoiExt.fromJson(json['poiExt'] as Map<String, dynamic>)
        : null;
    int source = json['source'] as int;
    int isMain = json['isMain'] as int;
    bool isInChina = json['isInChina'] as bool;
    String countryName = json['countryName'] as String;
    return Pois(poiType, poiId, poiName, businessId, districtId, poiExt, source,
        isMain, isInChina, countryName);
  }

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['poiType'] = poiType;
    data['poiId'] = poiId;
    data['poiName'] = poiName;
    data['businessId'] = businessId;
    data['districtId'] = districtId;
    if (poiExt != null) {
      data['poiExt'] = poiExt!.toJson();
    }
    data['source'] = source;
    data['isMain'] = isMain;
    data['isInChina'] = isInChina;
    data['countryName'] = countryName;
    return data;
  }
}

class PoiExt {
  String? h5Url;
  String? appUrl;

  PoiExt(this.h5Url, this.appUrl);

  factory PoiExt.fromJson(Map<String, dynamic> json) {
    return PoiExt(json['h5Url'] as String, json['appUrl'] as String);
  }

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'h5Url': h5Url,
        'appUrl': appUrl,
      };

  PoiExt clone() =>
      PoiExt.fromJson(jsonDecode(jsonEncode(this)) as Map<String, dynamic>);
}
