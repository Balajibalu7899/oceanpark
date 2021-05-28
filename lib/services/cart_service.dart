import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ocean_park/models/cart/cart.dart';
import 'package:ocean_park/models/product/cut.dart';
import 'package:ocean_park/models/product/product.dart';
import 'package:ocean_park/services/utilities/status.dart';

class CartService extends ChangeNotifier {
  Status _status = Status.loding();
  List<CartProduct> _cart = <CartProduct>[];
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference collection =
      FirebaseFirestore.instance.collection("Customers");
  int? _ativeProduct;

  Status get status => _status;
  List<CartProduct> get cart => _cart;
  double _totalprice = 0;
  double get totalprice => _totalprice;
  CartProduct get activeProduct => _cart[_ativeProduct!];

  CartService() {
    getCart();
  }

  //to get the cart that contain product units and price
  getCart() async {
    try {
      final cartItems =
          await collection.doc(user!.uid).collection("Cart").get();
      Iterable<String> productIds = cartItems.docs.map((p) => p.id);
      final productData = await FirebaseFirestore.instance
          .collection("products")
          .where(FieldPath.documentId, whereIn: productIds.toList())
          .get();

      for (int index = 0; index < productData.docs.length; index++) {
        CartProduct product =
            CartProduct.fromJson(productData.docs[index].data());
        product.productId = cartItems.docs[index].id;
        product.quantity = cartItems.docs[index].data()['quantity'];
        product.cut = cartItems.docs[index].data()['cut'];
        _cart.add(product);
        _totalprice += product.offerPrice! * product.quantity!;
      }
      _cart.forEach((element) {
        print(element.toJson());
      });
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  //to get the current product index
  int? productIndex(String productId) {
    for (int index = 0; index < _cart.length; index++) {
      if (_cart[index].productId == productId) {
        return index;
      }
    }
  }

  //to add to cart
  Future<void> addtoCart(Product product, int cutIndex) async {
    try {
      CartProduct cart = CartProduct(
        productId: product.productId,
        image: product.image,
        title: product.title,
        subTitle: product.subTitle,
        offerPrice: product.offerPrice,
        price: product.price,
        weight: product.weight,
        unitType: product.unitType,
        quantity: 1,
        cut: product.cuts![cutIndex].title,
      );
      await collection.doc("${user!.uid}/Cart/${product.productId}").set(
          {"quantity": 1, "cut": product.cuts![cutIndex].title ?? "Whole"});
      _cart.add(cart);
      _totalprice += cart.offerPrice!;
      _status = Status.completed();
      notifyListeners();
    } catch (error) {
      print(error);
      throw "error";
    }
  }

//to check the prioduct is their in the cart  or not
  bool inCart(String productId) {
    for (int i = 0; i < _cart.length; i++) {
      if (_cart[i].productId == productId) {
        _ativeProduct = i;
        return true;
      }
    }
    return false;
  }

  //to increase the units
  void increaseQuantity(int index) async {
    try {
      _cart[index].quantity = _cart[index].quantity! + 1;
      await collection
          .doc("${user!.uid}/Cart/${_cart[index].productId}")
          .update({"quantity": _cart[index].quantity});
      _totalprice += _cart[index].offerPrice!;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  //decrease the units
  decreaseQuantity(int index) async {
    try {
      _cart[index].quantity = _cart[index].quantity! - 1;
      await collection
          .doc("${user!.uid}/Cart/${_cart[index].productId}")
          .update({"quantity": _cart[index].quantity});
      _totalprice -= _cart[index].offerPrice!;
      notifyListeners();
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  //to delete the product from the cart
  void deleteFromCart(int itemIndex) async {
    try {
      await collection
          .doc("${user!.uid}/Cart/${_cart[itemIndex].productId}")
          .delete();
      _totalprice -= _cart[itemIndex].offerPrice!;
      _cart.remove(_cart[itemIndex]);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> clearCart() async {
    try {
      for (int index = 0; index < _cart.length; index++) {
        await collection
            .doc("${user!.uid}/Cart/${_cart[index].productId}")
            .delete();
        _cart.remove(_cart[index]);
      }
      _totalprice = 0;
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }
}
