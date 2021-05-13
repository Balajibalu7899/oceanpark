class Quantities {
  double? quantity;
  String? quantityType;

  Quantities({this.quantity, this.quantityType});

  factory Quantities.fromJson(Map<String, dynamic> json) {
    return Quantities(
      quantity: json['quantity'] as double?,
      quantityType: json['quantity_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'quantity_type': quantityType,
    };
  }
}
