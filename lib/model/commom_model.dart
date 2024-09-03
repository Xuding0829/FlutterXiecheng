class CommonModel {
  late String icon;
  late String title;
  late String url;
  late String statusBarColor;
  late bool hideAppBar;

  CommonModel(
      this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar);

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(json['icon'], json['title'], json['url'],
        json['statusBarColor'], json['hideAppBar']);
  }
}
