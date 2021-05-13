class Dispatched {
  String? by;
  String? time;

  Dispatched({this.by, this.time});

  factory Dispatched.fromJson(Map<String, dynamic> json) {
    return Dispatched(
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
