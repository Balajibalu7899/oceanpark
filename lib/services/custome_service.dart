import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '/models/customer/addresses.dart';
import '/models/customer/customer.dart';
import '/services/auth_service.dart';
import '/services/utilities/status.dart';

class CustomerService extends ChangeNotifier {
  Status status = Status.loding();
  Customer? _customer;
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference _reference =
      FirebaseFirestore.instance.collection("Customers");
  Customer get customer => _customer!;
  List<Addresses>? get addresses => _customer!.addresses;

  CustomerService() {
    getCustomer();
  }

  Future<bool> create(Customer customer) async {
    try {
      await _reference.doc(user?.uid).set(customer.toJson());
      AuthService.instance().setNewUser(false);
      notifyListeners();
      return true;
    } catch (err) {
      notifyListeners();
      return false;
    }
  }

  void getCustomer() async {
    try {
      final data = await _reference.doc(user?.uid).get();
      _customer = Customer.fromJson(data.data()!);
      status = Status.completed();
      notifyListeners();
    } catch (err) {
      status = Status.error();
      notifyListeners();
    }
  }

  void updateProfileImage(String url) async {
    try {
      await _reference.doc(user!.uid).set({'profile_image': url});
      _customer!.profileImage = url;
      status = Status.completed();
      notifyListeners();
    } catch (err) {
      status = Status.error();
      notifyListeners();
    }
  }

  Future<void> updateCustomer(Customer customer) async {
    try {
      await _reference.doc(user!.uid).update(customer.toUpdateJson());
      getCustomer();
    } catch (err) {
      status = Status.error();
      notifyListeners();
    }
  }

  Future<bool> updateAddress(
      List<Addresses> addresses, int defaultAddress) async {
    try {
      _customer!.addresses = addresses;
      _customer!.defaultAddress = defaultAddress;
      await _reference.doc(user?.uid).update(_customer!.addressToJson());
      notifyListeners();
      return true;
    } catch (err) {
      return false;
    }
  }

  deleteAddress(int index) async {
    try {
      _customer!.addresses!.removeAt(index);
      await _reference.doc(user!.uid).update(_customer!.toJson());
      notifyListeners();
    } catch (err) {
      notifyListeners();
    }
  }
}
