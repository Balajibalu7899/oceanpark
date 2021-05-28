import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String? id;
  String? image;
  String? title;
  String? slug;

  Category({
    this.id,
    this.image,
    this.title,
    this.slug,
  });

  factory Category.fromDoc(DocumentSnapshot doc) {
    return Category(
      id: doc.id,
      image: doc.data()!['image'] as String?,
      title: doc.data()!['title'] as String?,
      slug: doc.data()!['slug'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'slug': slug,
    };
  }
}
