import 'address.dart';
import 'order_product.dart';
import 'OrdereState.dart';

class Order {
  String? customerId;
  String? outlet;
  String? payment;
  int? time;
  String? expectedTime;
  String? status;
  int? itemsCount;
  double? totalPrice;
  double? discount;
  String? couponCode;
  Address? address;
  OrdereState? ordered;
  OrdereState? dispatched;
  OrdereState? delivered;
  List<OrderProduct>? products;

  Order({
    this.customerId,
    this.outlet,
    this.payment,
    this.time,
    this.expectedTime,
    this.status,
    this.itemsCount,
    this.totalPrice,
    this.discount,
    this.couponCode,
    this.address,
    this.ordered,
    this.dispatched,
    this.delivered,
    this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      customerId: json['customer_id'] as String?,
      outlet: json['outlet'] as String?,
      payment: json['payment'] as String?,
      time: json['time'] as int?,
      expectedTime: json['expected_time'] as String?,
      status: json['status'] as String?,
      itemsCount: json['items_count'] as int?,
      totalPrice: json['price'] as double?,
      discount: json['discount'] as double?,
      couponCode: json['coupon_code'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      ordered: json['ordered'] == null
          ? null
          : OrdereState.fromJson(json['ordered'] as Map<String, dynamic>),
      dispatched: json['dispatched'] == null
          ? null
          : OrdereState.fromJson(json['dispatched'] as Map<String, dynamic>),
      delivered: json['delivered'] == null
          ? null
          : OrdereState.fromJson(json['delivered'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'outlet': outlet,
      'payment': payment,
      'time': time,
      'expected_time': expectedTime,
      'status': status,
      'items_count': itemsCount,
      'price': totalPrice,
      'discount': discount,
      'coupon_code': couponCode,
      'address': address?.toJson(),
      'ordered': ordered?.toJson(),
      'dispatched': dispatched?.toJson(),
      'delivered': delivered?.toJson(),
    };
  }
}
