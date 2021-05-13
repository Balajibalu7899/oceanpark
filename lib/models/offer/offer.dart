import 'product.dart';

class Offer {
  String? title;
  String? subTitle;
  String? description;
  String? image;
  List<Product>? product;

  Offer({
    this.title,
    this.subTitle,
    this.description,
    this.image,
    this.product,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      product: (json['product'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'sub_title': subTitle,
      'description': description,
      'image': image,
      'product': product?.map((e) => e.toJson()).toList(),
    };
  }
}
