class Cut {
  String? title;
  String? image;
  String? weight;
  double? price;

  Cut({this.title, this.image, this.weight, this.price});

  factory Cut.fromJson(Map<String, dynamic> json) {
    return Cut(
        title: json['title'] == null ? null : json['title'] as String?,
        image: json['image'] == null ? null : json['image'] as String?,
        weight: json['weight'] == null ? null : json['weight'] as String?,
        price:
            json['price'] == null ? null : json['price'].toDouble() as double);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'image': image, 'weight': weight, 'price': price};
  }
}
