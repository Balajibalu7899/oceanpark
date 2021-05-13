class Delivered {
  String? by;
  String? time;

  Delivered({this.by, this.time});

  factory Delivered.fromJson(Map<String, dynamic> json) {
    return Delivered(
      by: json['by'] as String?,
      time: json['time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'by': by,
      'time': time,
    };
  }
}
