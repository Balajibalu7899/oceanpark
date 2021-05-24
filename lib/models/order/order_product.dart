import 'package:cloud_firestore/cloud_firestore.dart';

class OrderProduct {
  String? productId;
  String? title;
  String? image;
  double? price;
  double? weight;
  String? unitType;
  String? cut;

  OrderProduct({
    this.productId,
    this.title,
    this.image,
    this.price,
    this.weight,
    this.unitType,
    this.cut,
  });

  factory OrderProduct.fromDoc(DocumentSnapshot doc) {
    try {
      return OrderProduct(
        productId: doc.id,
        title: doc.data()!['title'] as String?,
        image: doc.data()!['image'] as String?,
        price: doc.data()!['price']!.toDouble() as double?,
        weight: doc.data()!['weight'].toDouble() as double?,
        unitType: doc.data()!['unit_type'] as String?,
        cut: doc.data()!['cut'] as String?,
      );
    } catch (err) {
      return OrderProduct();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'price': price,
      'weight': weight,
      'unit_type': unitType,
      'cut': cut
    };
  }
}
