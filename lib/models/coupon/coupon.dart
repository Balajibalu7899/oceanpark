class Coupon {
  String? code;
  String? title;
  String? subTitle;
  String? description;
  String? image;
  String? type;
  int? amount;
  int? minimumOrder;
  String? expiry;

  Coupon({
    this.code,
    this.title,
    this.subTitle,
    this.description,
    this.image,
    this.type,
    this.amount,
    this.minimumOrder,
    this.expiry,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      code: json['code'] as String?,
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      type: json['type'] as String?,
      amount: json['amount'] as int?,
      minimumOrder: json['minimum_order'] as int?,
      expiry: json['expiry'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'title': title,
      'sub_title': subTitle,
      'description': description,
      'image': image,
      'type': type,
      'amount': amount,
      'minimum_order': minimumOrder,
      'expiry': expiry,
    };
  }
}
