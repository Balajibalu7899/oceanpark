import 'addresses.dart';

class Customer {
  String? userId;
  String? name;
  String? email;
  int? phoneNumber;
  String? profileImage;
  String? tag;
  int? defaultAddress;
  List<Addresses>? addresses;

  Customer({
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.profileImage,
    this.tag,
    this.defaultAddress,
    this.addresses,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as int?,
      profileImage: json['profile_image'] as String?,
      tag: json['tag'] as String?,
      defaultAddress: json['default_address'] as int?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Addresses.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toUpdateJson() {
    return {
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'profile_image': profileImage,
    };
  }

  Map<String, dynamic> addressToJson() {
    return {
      'default_address': defaultAddress ?? 0,
      'addresses': addresses?.map((e) => e.toJson()).toList(),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'profile_image': profileImage,
      'tag': tag ?? "new",
      'default_address': defaultAddress ?? 0,
      'addresses': addresses?.map((e) => e.toJson()).toList(),
    };
  }
}
