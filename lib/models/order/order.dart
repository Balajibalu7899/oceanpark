import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ocean_park/models/order/payment_method.dart';
import 'package:ocean_park/models/payment/payment.dart';

import 'address.dart';
import 'order_product.dart';
import 'OrdereState.dart';

class Order {
  String? id;
  String? customerId;
  String? outlet;
  Timestamp? time;
  Timestamp? expectedTime;
  String? status;
  int? itemsCount;
  double? price;
  double? discount;
  double? totalPrice;
  String? couponCode;
  double? couponAmount;
  Address? address;
  OrdereState? ordered;
  OrdereState? dispatched;
  OrdereState? delivered;
  OrdereState? cancelled;
  PaymentMethod? payment;
  List<OrderProduct>? products;

  Order({
    this.id,
    this.customerId,
    this.outlet,
    this.payment,
    this.time,
    this.expectedTime,
    this.status,
    this.itemsCount,
    this.price,
    this.discount,
    this.totalPrice,
    this.couponCode,
    this.couponAmount,
    this.address,
    this.ordered,
    this.dispatched,
    this.delivered,
    this.cancelled,
    this.products,
  });

  factory Order.fromDoc(DocumentSnapshot doc) {
    return Order(
      id: doc.id,
      customerId: doc.data()!['customer_id'] as String?,
      outlet: doc.data()!['outlet'] as String?,
      time: doc.data()!['time'] as Timestamp?,
      expectedTime: doc.data()!['expected_time'] as Timestamp?,
      status: doc.data()!['status'] as String?,
      itemsCount: doc.data()!['items_count'] as int?,
      price: doc.data()!['price'].toDouble() as double?,
      discount: doc.data()!['discount'].toDouble() as double?,
      totalPrice: doc.data()!['total_price'].toDouble() as double?,
      couponCode: doc.data()!['coupon_code'] as String?,
      couponAmount: doc.data()!['coupon_amount'] != null
          ? doc.data()!['coupon_amount'].toDouble() as double?
          : null,
      address: doc.data()!['address'] == null
          ? null
          : Address.fromJson(doc.data()!['address'] as Map<String, dynamic>),
      ordered: doc.data()!['ordered'] == null
          ? null
          : OrdereState.fromJson(
              doc.data()!['ordered'] as Map<String, dynamic>),
      dispatched: doc.data()!['dispatched'] == null
          ? null
          : OrdereState.fromJson(
              doc.data()!['dispatched'] as Map<String, dynamic>),
      delivered: doc.data()!['delivered'] == null
          ? null
          : OrdereState.fromJson(
              doc.data()!['delivered'] as Map<String, dynamic>),
      cancelled: doc.data()!['cancelled'] == null
          ? null
          : OrdereState.fromJson(
              doc.data()!['cancelled'] as Map<String, dynamic>),
      payment: doc.data()!['payment'] == null
          ? null
          : PaymentMethod.fromJson(
              doc.data()!['payment'] as Map<String, dynamic>),
      products: <OrderProduct>[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'outlet': outlet,
      'time': time,
      if (expectedTime != null) 'expected_time': expectedTime,
      'status': status,
      'items_count': itemsCount,
      'price': price,
      'discount': discount,
      'total_price': totalPrice,
      if (couponCode != null) 'coupon_code': couponCode,
      if (couponAmount != null) 'coupon_amount': couponAmount,
      'address': address?.toJson(),
      'ordered': ordered?.toJson(),
      'payment': payment!.toJson(),
    };
  }
}
