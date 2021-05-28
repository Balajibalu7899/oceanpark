import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ocean_park/models/category/category.dart';
import 'package:ocean_park/services/utilities/status.dart';

class CategoryService with ChangeNotifier {
  Status _status = Status.loding();
  List<Category> _categories = <Category>[];
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('Categories');
  Status get status => _status;
  List<Category> get categories => _categories;

  CategoryService() {
    getCategories();
  }

  getCategories() async {
    try {
      final categories = await collectionRef.get();
      categories.docs
          .forEach((category) => _categories.add(Category.fromDoc(category)));
      _status = Status.completed();
      notifyListeners();
    } catch (err) {
      _status = Status.error();
      print(err);
    }
  }
}
