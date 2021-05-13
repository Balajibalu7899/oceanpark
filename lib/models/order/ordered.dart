class Ordered {
  String? by;
  String? time;

  Ordered({this.by, this.time});

  factory Ordered.fromJson(Map<String, dynamic> json) {
    return Ordered(
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
