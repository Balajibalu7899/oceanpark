class Payment {
  String? customerId;
  String? orderId;
  String? time;
  double? price;
  String? source;
  String? status;
  String? transactionId;
  String? arnNumber;

  Payment({
    this.customerId,
    this.orderId,
    this.time,
    this.price,
    this.source,
    this.status,
    this.transactionId,
    this.arnNumber,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      customerId: json['customer_id'] as String?,
      orderId: json['order_id'] as String?,
      time: json['time'] as String?,
      price: json['price'] as double?,
      source: json['source'] as String?,
      status: json['status'] as String?,
      transactionId: json['transaction_id'] as String?,
      arnNumber: json['arn_number'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'order_id': orderId,
      'time': time,
      'price': price,
      'source': source,
      'status': status,
      'transaction_id': transactionId,
      'arn_number': arnNumber,
    };
  }
}
