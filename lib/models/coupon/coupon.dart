import 'package:cloud_firestore/cloud_firestore.dart';

class Coupon {
  String? code;
  String? title;
  String? subTitle;
  String? description;
  String? image;
  String? type;
  int? amount;
  int? minimumOrder;
  Timestamp? expiry;

  Coupon({
    this.code,
    this.title,
    this.subTitle,
    this.description,
    this.image,
    this.type,
    this.amount,
    this.minimumOrder,
    this.expiry,
  });

  factory Coupon.fromDoc(DocumentSnapshot doc) {
    return Coupon(
      code: doc.data()!['code'] as String?,
      title: doc.data()!['title'] as String?,
      subTitle: doc.data()!['sub_title'] as String?,
      description: doc.data()!['description'] as String?,
      image: doc.data()!['image'] as String?,
      type: doc.data()!['type'] as String?,
      amount: doc.data()!['amount'] as int?,
      minimumOrder: doc.data()!['minimum_order'] as int?,
      expiry: doc.data()!['expiry'] as Timestamp?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'title': title,
      'sub_title': subTitle,
      'description': description,
      'image': image,
      'type': type,
      'amount': amount,
      'minimum_order': minimumOrder,
      'expiry': expiry,
    };
  }
}
