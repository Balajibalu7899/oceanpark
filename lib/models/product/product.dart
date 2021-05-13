

import 'package:ocean_park/models/product/cut.dart';

import 'delivery.dart';

class Product {
  String? productId;
  String? title;
  String? subTitle;
  String? description;
  String? image;
  double? price;
  int? discount;
  String? tag;
  String? badge;
  String? quality;
  double? weight;
  List<String>? type;
  List<Cut>? cuts;
  Delivery? delivery;
  List<String>? outlets;
  String? unittype;

  Product({
    this.productId,
    this.title,
    this.subTitle,
    this.description,
    this.image,
    this.price,
    this.discount,
    this.tag,
    this.badge,
    this.quality,
    this.weight,
    this.type,
    this.cuts,
    this.delivery,
    this.outlets,
    this.unittype,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    try {
      return Product(
        productId: json['product_id'] as String?,
        title: json['title'] as String?,
        subTitle: json['sub_title'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        price: json['price']!.toDouble() as double?,
        discount: json['discount'] as int?,
        tag: json['tag'] as String?,
        badge: json['badge'] as String?,
        quality: json['quality'] as String?,
        weight: json['weight'] as double?,
        unittype: json['unit_type'] as String,
        type: json['type'] == null ? null : List<String>.from(json['type']),
        cuts: json['cuts'] == null
            ? null
            : (json['cuts'] as List<dynamic>?)
                ?.map((e) => Cut.fromJson(e as Map<String, dynamic>))
                .toList(),
        delivery: json['delivery'] == null
            ? null
            : Delivery.fromJson(json['delivery'] as Map<String, dynamic>),
        outlets: json['outlets'] as List<String>?,
      );
    } catch (err) {
      print(err);
      return Product();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'title': title,
      'sub_title': subTitle,
      'description': description,
      'image': image,
      'price': price,
      'discount': discount,
      'tag': tag,
      'badge': badge,
      'quality': quality,
      'weight': weight,
      'unit_type': unittype,
      'type': type,
      'cuts': cuts,
      'delivery': delivery?.toJson(),
      'outlets': outlets,
    };
  }
}
