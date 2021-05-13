import 'package:cloud_firestore/cloud_firestore.dart';

import 'quantities.dart';

class Cart {
  String? productId;
  String? title;
  String? subTitle;
  String? image;
  double? price;
  int? discount;
  int? units;
  double? quantity;
  String? quantityType;
  List<Quantities>? quantities;
  String? cut;
  List<String>? cuts;

  Cart({
    this.productId,
    this.title,
    this.subTitle,
    this.image,
    this.price,
    this.discount,
    this.units,
    this.quantity,
    this.quantityType,
    this.quantities,
    this.cut,
    this.cuts,
  });

  factory Cart.fromDoc(DocumentSnapshot doc) {
    return Cart(
      productId: doc.id,
      title: doc.data()!['title'] as String?,
      subTitle: doc.data()!['sub_title'] as String?,
      image: doc.data()!['image'] as String?,
      price: doc.data()!['price'] as double?,
      discount: doc.data()!['discount'] as int?,
      units: doc.data()!['units'] as int?,
      quantity: doc.data()!['quantity'] as double?,
      quantityType: doc.data()!['quantity_type'] as String?,
      quantities: (doc.data()!['quantities'] as List<dynamic>?)
          ?.map((e) => Quantities.fromJson(e as Map<String, dynamic>))
          .toList(),
      cut: doc.data()!['cut'] as String?,
      cuts: doc.data()!['cuts'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'title': title,
      'sub_title': subTitle,
      'image': image,
      'price': price,
      'discount': discount,
      'units': units,
      'quantity': quantity,
      'quantity_type': quantityType,
      'quantities': quantities?.map((e) => e.toJson()).toList(),
      'cut': cut,
      'cuts': cuts,
    };
  }
}
