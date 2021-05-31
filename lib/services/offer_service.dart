import 'package:flutter/material.dart';
import '/models/offer/offer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/product/product.dart';
import '/services/utilities/status.dart';

class OfferService with ChangeNotifier {
  Status _status = Status.loding();
  List<Offer> _offers = <Offer>[];
  List<Product> _products = <Product>[];

  Status get status => _status;
  List<Offer> get offers => _offers;
  List<Product> get products => _products;

  OfferService() {
    getOffers();
  }

  getOffers() async {
    try {
      final offersData =
          await FirebaseFirestore.instance.collection("Offers").get();
      offersData.docs.forEach((offer) => _offers.add(Offer.fromDoc(offer)));
      _status = Status.completed();
      notifyListeners();
      getProducts(_offers[0].id!);
    } catch (err) {
      _status = Status.error();
      print(err);
    }
  }

  getProducts(String offerId) async {
    _products = <Product>[];
    try {
      final productsData = await FirebaseFirestore.instance
          .collection("products")
          .where("offer", isEqualTo: offerId)
          .get();
      productsData.docs
          .forEach((product) => _products.add(Product.fromDoc(product)));
      _status = Status.completed();
      print(_products.length);
      notifyListeners();
    } catch (err) {
      _status = Status.error();
      print(err);
    }
  }
}
