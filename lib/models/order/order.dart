import 'address.dart';
import 'delivered.dart';
import 'dispatched.dart';
import 'ordered.dart';

class Order {
  String? customerId;
  String? outlet;
  String? payment;
  String? time;
  String? expectedTime;
  String? status;
  int? itemsCount;
  double? price;
  double? discount;
  String? couponCode;
  Address? address;
  Ordered? ordered;  
  Dispatched? dispatched;
  Delivered? delivered;

  Order({
    this.customerId,
    this.outlet,
    this.payment,
    this.time,
    this.expectedTime,
    this.status,
    this.itemsCount,
    this.price,
    this.discount,
    this.couponCode,
    this.address,
    this.ordered,
    this.dispatched,
    this.delivered,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      customerId: json['customer_id'] as String?,
      outlet: json['outlet'] as String?,
      payment: json['payment'] as String?,
      time: json['time'] as String?,
      expectedTime: json['expected_time'] as String?,
      status: json['status'] as String?,
      itemsCount: json['items_count'] as int?,
      price: json['price'] as double?,
      discount: json['discount'] as double?,
      couponCode: json['coupon_code'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      ordered: json['ordered'] == null
          ? null
          : Ordered.fromJson(json['ordered'] as Map<String, dynamic>),
      dispatched: json['dispatched'] == null
          ? null
          : Dispatched.fromJson(json['dispatched'] as Map<String, dynamic>),
      delivered: json['delivered'] == null
          ? null
          : Delivered.fromJson(json['delivered'] as Map<String, dynamic>),
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
      'price': price,
      'discount': discount,
      'coupon_code': couponCode,
      'address': address?.toJson(),
      'ordered': ordered?.toJson(),
      'dispatched': dispatched?.toJson(),
      'delivered': delivered?.toJson(),
    };
  }
}
