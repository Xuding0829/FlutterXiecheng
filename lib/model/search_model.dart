class SearchModel {
  String keyword;
  List<SearchItem> data;

  SearchModel({
    required this.keyword,
    required this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    var dataJson = json['data'] as List;
    List<SearchItem> data =
        dataJson.map((i) => SearchItem.fromJson(i)).toList();

    return SearchModel(keyword: json['keyword'] ?? '', data: data);
  }
}

class SearchItem {
  final String? word;
  final String? type;
  final String? price;
  final String? star;
  final String? zonename;
  final String? districtname;
  final String? url;

  SearchItem(this.word, this.type, this.price, this.star, this.zonename,
      this.districtname, this.url);

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(json['word'], json['type'], json['price'], json['star'],
        json['zonename'], json['districtname'], json['url']);
  }
}
