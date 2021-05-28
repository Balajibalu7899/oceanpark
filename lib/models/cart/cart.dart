class CartProduct {
  String? productId;
  String? image;
  String? title;
  String? subTitle;
  double? price;
  double? offerPrice;
  double? weight;
  String? unitType;
  int? quantity;
  String? cut;

  CartProduct({
    this.productId,
    this.image,
    this.title,
    this.subTitle,
    this.price,
    this.offerPrice,
    this.weight,
    this.unitType,
    this.quantity,
    this.cut,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      productId: json['product_id'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
      price: json['price'].toDouble() as double?,
      offerPrice: json['offer_price'].toDouble() as double?,
      weight: json['weight'].toDouble() as double?,
      unitType: json['unit_type'] as String?,
      quantity: json['quantity'] as int?,
      cut: json['cut'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'image': image,
      'title': title,
      'sub_title': subTitle,
      'price': price,
      'offer_price': offerPrice,
      'weight': weight,
      'unit_type': unitType,
      'quantity': quantity,
      'cut': cut,
    };
  }
}
