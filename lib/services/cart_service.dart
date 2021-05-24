import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ocean_park/models/cart/cart.dart';
import 'package:ocean_park/models/product/product.dart';
import 'package:ocean_park/services/utilities/status.dart';

class CartService extends ChangeNotifier {
  Status _status = Status.loding();
  List<Cart> _cart = <Cart>[];
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference collection =
      FirebaseFirestore.instance.collection("customers");
  int? _ativeProduct;

  Status get status => _status;
  List<Cart> get cart => _cart;
  double _totalprice = 0;
  double get totalprice => _totalprice;
  Cart get activeProduct => _cart[_ativeProduct!];

  CartService() {
    getCart();
  }

  //to get the cart that contain product units and price
  getCart() async {
    try {
      final data = await collection.doc(user!.uid).collection("cart").get();
      Iterable<String> products = data.docs.map((e) => e.id);
      print(products);
      data.docs.forEach((element) {
        _cart.add(Cart.fromJson(element.data()));
      });
      getProduct();
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
  Future<void> addtoCart(Cart cart) async {
    try {
      await collection
          .doc("${user!.uid}/cart/${cart.productId}")
          .set({"units": 1, "price": cart.price});
      _cart.add(cart);
      _status = Status.completed();
      notifyListeners();
    } catch (error) {
      _status = Status.error();
      notifyListeners();
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

  //to get the products of thecart
  void getProduct() async {
    final product =
        await FirebaseFirestore.instance.collection("products").get();
    product.docs.forEach((element) {
      for (int i = 0; i < _cart.length; i++) {
        if (_cart[i].productId == element.id) {
          Product product = Product.fromDoc(element);
          _cart[i].title = product.title;
          _cart[i].subTitle = product.subTitle;
          _cart[i].price = product.price;
          _cart[i].image = product.image;
          _cart[i].unitType = product.unitType;
          _totalprice += product.price! * _cart[i].quantity!;
        }
      }
    });

    notifyListeners();
  }

  //to increase the units
  void increaseQuantity(int index) async {
    try {
      _cart[index].quantity = _cart[index].quantity! + 1;
      await collection
          .doc("${user!.uid}/cart/${_cart[index].productId}")
          .update({"units": _cart[index].quantity});
      _totalprice += _cart[index].price!;
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
          .doc("${user!.uid}/cart/${_cart[index].productId}")
          .update(
              {"units": _cart[index].quantity, "price": _cart[index].price});
      _totalprice -= _cart[index].price!;
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
          .doc("${user!.uid}/cart/${_cart[itemIndex].productId}")
          .delete();
      _totalprice -= _cart[itemIndex].price!;
      _cart.remove(_cart[itemIndex]);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
