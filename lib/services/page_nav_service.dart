import 'package:flutter/material.dart';
import 'package:ocean_park/models/offer/offer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ocean_park/models/product/product.dart';
import 'package:ocean_park/services/utilities/status.dart';

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
