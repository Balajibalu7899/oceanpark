import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocean_park/models/coupon/coupon.dart';
import 'package:ocean_park/services/utilities/status.dart';

class CouponService with ChangeNotifier {
  Status _status = Status.loding();
  List<Coupon> _coupons = <Coupon>[];
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('Customers');
  Status get status => _status;
  List<Coupon> get coupons => _coupons;

  CouponService() {
    getCoupons();
  }

  getCoupons() async {
    try {
      final coupons =
          await collectionRef.doc(user!.uid).collection("Coupons").get();
      coupons.docs
          .forEach((category) => _coupons.add(Coupon.fromDoc(category)));
      _status = Status.completed();
      notifyListeners();
    } catch (err) {
      print(err);
      _status = Status.error();
      notifyListeners();
    }
  }
}
