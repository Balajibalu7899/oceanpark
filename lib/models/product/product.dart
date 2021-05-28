import 'package:cloud_firestore/cloud_firestore.dart';

import 'cut.dart';
import 'specials.dart';
import 'delivery.dart';

class Product {
  String? productId;
  String? image;
  String? title;
  String? subTitle;
  String? description;
  double? price;
  double? offerPrice;
  double? discount;
  double? weight;
  String? unitType;
  String? badge;
  List<String>? categories;
  List<String>? tags;
  List<Cut>? cuts;
  Delivery? delivery;
  List<Specials>? specials;
  List<String>? outlets;

  Product({
    this.productId,
    this.image,
    this.title,
    this.subTitle,
    this.description,
    this.categories,
    this.price,
    this.offerPrice,
    this.discount,
    this.weight,
    this.unitType,
    this.badge,
    this.tags,
    this.cuts,
    this.delivery,
    this.specials,
    this.outlets,
  });

  factory Product.fromDoc(DocumentSnapshot doc) {
    try {
      return Product(
        productId: doc.id,
        image: doc.data()!['image'] as String?,
        title: doc.data()!['title'] as String?,
        subTitle: doc.data()!['sub_title'] as String?,
        description: doc.data()!['description'] as String?,
        price: doc.data()!['price']!.toDouble() as double?,
        offerPrice: doc.data()!['offer_price'].toDouble() as double?,
        discount: (((doc.data()!['price'] - doc.data()!['offer_price']) /
                doc.data()!['price']) *
            100),
        badge: doc.data()!['badge'] as String?,
        weight: doc.data()!['weight'] as double?,
        unitType: doc.data()!['unit_type'] as String,
        categories: doc.data()!['categories'] == null
            ? null
            : List<String>.from(doc.data()!['categories']),
        cuts: doc.data()!['cuts'] == null
            ? null
            : (doc.data()!['cuts'] as List<dynamic>?)
                ?.map((e) => Cut.fromJson(e as Map<String, dynamic>))
                .toList(),
        delivery: doc.data()!['delivery'] == null
            ? null
            : Delivery.fromJson(
                doc.data()!['delivery'] as Map<String, dynamic>),
        specials: doc.data()!['specials'] == null
            ? null
            : (doc.data()!['specials'] as List<dynamic>?)
                ?.map((e) => Specials.fromJson(e as Map<String, dynamic>))
                .toList(),
        outlets: doc.data()!['outlets'] as List<String>?,
      );
    } catch (err) {
      print(doc.id);
      print(err);

      return Product();
    }
  }
}
