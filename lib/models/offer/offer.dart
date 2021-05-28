import 'package:cloud_firestore/cloud_firestore.dart';

class Offer {
  String? id;
  String? title;
  String? subTitle;
  String? description;
  String? image;

  Offer({
    this.id,
    this.title,
    this.subTitle,
    this.description,
    this.image,
  });

  factory Offer.fromDoc(DocumentSnapshot doc) {
    return Offer(
      id: doc.id,
      title: doc.data()!['title'] as String?,
      subTitle: doc.data()!['sub_title'] as String?,
      description: doc.data()!['description'] as String?,
      image: doc.data()!['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'sub_title': subTitle,
      'description': description,
      'image': image,
    };
  }
}
