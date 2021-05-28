import 'location.dart';

class Addresses {
  String? name;
  String? phone;
  String? address;
  CustomeLocation? location;
  String? homeNumber;
  String? street;
  String? locatity;
  String? city;
  String? state;
  int? pinCode;

  Addresses({
    this.name,
    this.phone,
    this.address,
    this.location,
    this.homeNumber,
    this.street,
    this.locatity,
    this.city,
    this.state,
    this.pinCode,
  });

  factory Addresses.fromJson(Map<String, dynamic> json) {
    return Addresses(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      location: json['location'] == null
          ? null
          : CustomeLocation.fromJson(json['location'] as Map<String, dynamic>),
      homeNumber: json['home_number'] as String?,
      street: json['street'] as String?,
      locatity: json['locatity'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      pinCode: json['pin_code'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'location': location?.toJson(),
      'home_number': homeNumber,
      'street': street,
      'locatity': locatity,
      'city': city,
      'state': state,
      'pin_code': pinCode,
    };
  }
}
