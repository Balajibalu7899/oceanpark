import 'package:flutter/material.dart';
import '/models/offer/offer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/product/product.dart';
import '/services/utilities/status.dart';

class PageNavService with ChangeNotifier {
  int _activePage = 0;

  int get page => _activePage;

  changePage(int index) {
    if (index < 4) {
      _activePage = index;
      notifyListeners();
    }
  }
}
