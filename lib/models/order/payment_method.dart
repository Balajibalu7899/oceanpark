import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentMethod {
  String? id;
  String? method;
  Timestamp? time;

  PaymentMethod({this.id, this.method, this.time});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'] as String?,
      method: json['method'] as String?,
      time: json['time'] as Timestamp?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'method': method,
      'time': time,
    };
  }
}
