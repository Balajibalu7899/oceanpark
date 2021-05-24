class Specials {
  String? image;
  String? title;
  String? subTitle;

  Specials({this.image, this.title, this.subTitle});

  factory Specials.fromJson(Map<String, dynamic> json) {
    return Specials(
      image: json['image'] as String?,
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
    );
  }
}
