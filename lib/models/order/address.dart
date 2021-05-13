import 'location.dart';

class Address {
  String? name;
  int? phoneNumber;
  String? address;
  Location? location;

  Address({
    this.name,
    this.phoneNumber,
    this.address,
    this.location,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as int?,
      address: json['address'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone_number': phoneNumber,
      'address': address,
      'location': location?.toJson(),
    };
  }
}
