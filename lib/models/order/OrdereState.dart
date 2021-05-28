import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class OrdereState {
  String? by;
  Timestamp? time;

  OrdereState({this.by, this.time});

  factory OrdereState.fromJson(Map<String, dynamic> json) {
    return OrdereState(
      by: json['by'] as String?,
      time: json['time'] as Timestamp?,
    );
  }

  String timeToString(Timestamp time) {
    return DateFormat('MMMM d EE / HH:mm a').format(time.toDate());
  }

  Map<String, dynamic> toJson() {
    return {
      'by': by,
      'time': time,
    };
  }
}
