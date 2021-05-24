import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ocean_park/models/cart/cart.dart';
import 'package:ocean_park/models/order/order.dart';
import 'package:ocean_park/models/order/OrdereState.dart';
import 'package:ocean_park/models/order/order_product.dart';
import 'package:ocean_park/services/utilities/status.dart';

class OrderService with ChangeNotifier {
  Status status = Status.loding();
  User? user = FirebaseAuth.instance.currentUser;
  Order? _order;

  void create(List<Cart> cart) {
    _order = Order(
      status: "Ordered",
      ordered: OrdereState(
        by: "Customer",
        time: DateTime.now().millisecondsSinceEpoch,
      ),
      time: DateTime.now().millisecondsSinceEpoch,
      itemsCount: cart.length,
      totalPrice: 0,
    );
    cart.forEach((product) {
      // _order!.totalPrice = _order!.totalPrice! + product.offerPrice!;
      _order!.products!.add(
        OrderProduct(
          productId: product.productId,
          image: product.image,
          title: product.title,
          price: product.price,
          weight: product.weight,
          unitType: product.unitType,
          cut: product.cut,
        ),
      );
    });
    _order!.products!.forEach((element) {
      print(element);
    });
  }
}
