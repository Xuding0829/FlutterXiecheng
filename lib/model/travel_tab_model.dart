class TravelTabModel {
  Map<String, dynamic>? params;
  String url;
  List<TravelTab> tabs;

  TravelTabModel(this.params, this.url, this.tabs);

  factory TravelTabModel.fromJson(Map<String, dynamic> json) {
    List<TravelTab> tabs = [];
    if (json['tabs'] != null) {
      json['tabs'].foreach((v) {
        tabs.add(TravelTab.fromJson(v as Map<String, dynamic>));
      });
    }

    return TravelTabModel(
        json['params'] as Map<String, dynamic>?, json['url'] as String, tabs);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = this.url;
    data['tabs'] = tabs.map((v) => v.toJson()).toList();
    return data;
  }
}

class TravelTab {
  String labelName;
  String groupChannelCode;

  TravelTab(this.labelName, this.groupChannelCode);

  factory TravelTab.fromJson(Map<String, dynamic> json) {
    return TravelTab(json['labelName'], json['groupChannelCode']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['labelName'] = labelName;
    data['groupChannelCode'] = groupChannelCode;
    return data;
  }
}
