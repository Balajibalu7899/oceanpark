class Delivery {
  String? description;
  String? time;

  Delivery({this.description, this.time});

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      description: json['description'] as String?,
      time: json['time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'time': time,
    };
  }
}
