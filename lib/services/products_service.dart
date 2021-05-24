import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:ocean_park/models/product/product.dart';
import 'package:ocean_park/services/utilities/status.dart';

class ProductService extends ChangeNotifier {
  Status status = Status.loding();
  List<Product> _products = <Product>[];
  List<Product> _matchedProducts = <Product>[];
  List<Product>? get matchedProduct => _matchedProducts;
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference collection =
      FirebaseFirestore.instance.collection("products");
  List<Product>? get products => _products;
  ProductService() {
    getProducts();
  }

  void getProducts() async {
    try {
      final data = await collection.get();
      data.docs.forEach((product) {
        _products.add(Product.fromDoc(product));
      });
      status = Status.completed();
      notifyListeners();
    } catch (err) {
      status = Status.error();
      print(err);
      notifyListeners();
    }
  }

  searchProduct(String text) async {
    if (_products.length != null) {
      _products.forEach((element) {
        if (element.title == text) {
          _matchedProducts.add(element);
        }
      });
    }
    print(_matchedProducts.length);
  }
}
