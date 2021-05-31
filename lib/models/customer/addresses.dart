import 'location.dart';

class Addresses {
  String? name;
  String? phone;
  String? area;
  String? street;
  String? locatity;
  String? city;
  String? state;
  int? pinCode;
  String? address;
  CustomeLocation? location;

  Addresses({
    this.name,
    this.phone,
    this.area,
    this.street,
    this.locatity,
    this.city,
    this.state,
    this.pinCode,
    this.address,
    this.location,
  });

  factory Addresses.fromJson(Map<String, dynamic> json) {
    return Addresses(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      area: json['area'] as String?,
      street: json['street'] as String?,
      locatity: json['locatity'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      pinCode: json['pin_code'] as int?,
      address: json['address'] as String?,
      location: json['location'] == null
          ? null
          : CustomeLocation.fromJson(json['location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'area': area,
      'street': street,
      'locatity': locatity,
      'city': city,
      'state': state,
      'pin_code': pinCode,
      'address': address,
      'location': location?.toJson(),
    };
  }
}
