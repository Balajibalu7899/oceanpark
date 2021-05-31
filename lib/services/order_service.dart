import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/models/cart/cart.dart';
import '/models/order/order.dart';
import '/models/coupon/coupon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/order/OrdereState.dart';
import '/services/utilities/status.dart';
import '/models/order/order_product.dart';
import '/models/order/payment_method.dart';

class OrderService with ChangeNotifier {
  Status status = Status.loding();
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference _collRef =
      FirebaseFirestore.instance.collection('Orders');
  Order? _order;
  List<Order> _orders = <Order>[];

  Order get order => _order!;
  List<Order> get orders => _orders;

  OrderService() {
    getOrders();
  }

  getOrders() async {
    try {
      final ordersData =
          await _collRef.where("customer_id", isEqualTo: user!.uid).get();
      for (int index = 0; index < ordersData.docs.length; index++) {
        final order = Order.fromDoc(ordersData.docs[index]);
        final productData =
            await _collRef.doc(order.id).collection('Products').get();
        productData.docs.forEach((product) {
          order.products!.add(OrderProduct.fromDoc(product));
        });
        _orders.add(order);
      }
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  void create(List<CartProduct> cart) {
    try {
      _order = Order(
        customerId: user!.uid,
        status: "Ordered",
        outlet: "Banglore",
        ordered: OrdereState(
          by: "Customer",
          time: Timestamp.now(),
        ),
        time: Timestamp.now(),
        itemsCount: cart.length,
        price: 0,
        discount: 0,
        totalPrice: 0,
        products: [],
      );
      cart.forEach((item) {
        OrderProduct product = OrderProduct(
          productId: item.productId,
          image: item.image,
          title: item.title,
          price: item.offerPrice! * item.quantity!,
          weight: item.weight! * item.quantity!,
          unitType: item.unitType,
          cut: item.cut,
        );
        _order!.products!.add(product);
        _order!.price = _order!.price! + (item.price! * item.quantity!);
        _order!.discount = _order!.discount! +
            ((item.price! * item.quantity!) -
                (item.offerPrice! * item.quantity!));
      });
      _order!.totalPrice = (_order!.price! - _order!.discount!);
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  void addCoupon(Coupon coupon) {
    if (_order!.totalPrice! > coupon.minimumOrder!.toDouble()) {
      _order!.couponCode = coupon.code;
      if (coupon.type == "%") {
        _order!.couponAmount = (_order!.totalPrice! * (coupon.amount! / 100));
        _order!.totalPrice = (_order!.totalPrice! - _order!.couponAmount!);
        notifyListeners();
      } else {
        _order!.couponAmount = coupon.amount!.toDouble();
        _order!.totalPrice = (_order!.totalPrice! - coupon.amount!);
        notifyListeners();
      }
    } else {
      print("Cont be applied");
    }
  }

  addPayment(PaymentMethod paymentMethod) {
    _order!.payment = paymentMethod;
    notifyListeners();
  }

  placeOrder() async {
    final order = await _collRef.add(_order!.toJson());
    for (int index = 0; index < _order!.products!.length; index++) {
      await _collRef
          .doc(order.id)
          .collection("Products")
          .doc(_order!.products![index].productId)
          .set(_order!.products![index].toJson());
    }
    _order = null;
    notifyListeners();
  }
}
