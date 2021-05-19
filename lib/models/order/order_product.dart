import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ocean_park/models/product/cut.dart';

class OrderProduct {
  String? productId;
  String? title;
  String? subTitle;
  String? image;
  double? price;
  int? offerPrice;
  double? weight;
  String? unitType;
  double? units;

  OrderProduct(
      {this.productId,
      this.title,
      this.subTitle,
      this.image,
      this.price,
      this.offerPrice,
      this.weight,
      this.unitType,
      this.units});

  factory OrderProduct.fromDoc(DocumentSnapshot doc) {
    try {
      return OrderProduct(
        productId: doc.id as String?,
        title: doc.data()!['title'] as String?,
        subTitle: doc.data()!['sub_title'] as String?,
        image: doc.data()!['image'] as String?,
        price: doc.data()!['price']!.toDouble() as double?,
        offerPrice: doc.data()!['offer_price'] as int?,
        weight: doc.data()!['weight'].toDouble() as double?,
        unitType: doc.data()!['unit_type'] as String?,
        units: doc.data()!['units'].toDouble() as double?,
      );
    } catch (err) {
      print(err);
      return OrderProduct();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'sub_title': subTitle,
      'image': image,
      'price': price,
      'weight': weight,
    };
  }
}
