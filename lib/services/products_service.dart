import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import '/models/filter/filter.dart';
import '/models/product/product.dart';
import '/services/utilities/status.dart';

class ProductService extends ChangeNotifier {
  Status status = Status.loding();
  List<Product> _products = <Product>[];
  List<Product> _allProducts = <Product>[];
  List<Product> _matchedProducts = <Product>[];
  List<Filter> _filters = <Filter>[];
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference collection =
      FirebaseFirestore.instance.collection("products");
  CollectionReference? filterCollection;

  List<Product>? get products => _products;
  List<Product>? get matchedProduct => _matchedProducts;

  ProductService() {
    getProducts();
  }

  void getProducts() async {
    try {
      final data = await collection.get();
      data.docs.forEach((product) {
        _products.add(Product.fromDoc(product));
      });
      _allProducts = _products;
      status = Status.completed();
      notifyListeners();
    } catch (err) {
      status = Status.error();
      print(err);
      notifyListeners();
    }
  }

  addFilter(Filter filter) {
    if (_filters.isNotEmpty) {
      for (int index = 0; index < _filters.length; index++) {
        switch (_filters[index].type) {
          case FilterType.CATEGORY:
            _filters[index].data = filter.data;
            break;
          case FilterType.CUT:
            _filters[index].data = filter.data;
            break;
          case FilterType.SEARCH:
            _filters[index].data = filter.data;
            break;
          default:
            _filters.add(filter);
        }
      }
    } else {
      _filters.add(filter);
    }
  }

  applyFilter() async {
    _products = _allProducts;
    _filters.forEach((filter) {
      switch (filter.type) {
        case FilterType.CATEGORY:
          print(filter.data);
          _products = _products
              .where((product) => product.categories!.contains(filter.data))
              .toList();
          break;
        case FilterType.CUT:
          _products = _products
              .where((product) => product.cuts!.contains(filter.data))
              .toList();
          break;
        case FilterType.SEARCH:
          _products = _products
              .where((product) => product.title!.contains(filter.data))
              .toList();
          break;
        default:
          _products = _allProducts;
      }
    });
    print(_products.length);
    notifyListeners();
  }

  clearFilter() {}
}
