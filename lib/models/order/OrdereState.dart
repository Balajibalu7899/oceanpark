class OrdereState {
  String? by;
  int? time;

  OrdereState({this.by, this.time});

  factory OrdereState.fromJson(Map<String, dynamic> json) {
    return OrdereState(
      by: json['by'] as String?,
      time: json['time'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'by': by,
      'time': time,
    };
  }
}
