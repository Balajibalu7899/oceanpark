class CustomeLocation {
  double? latitude;
  double? longitude;

  CustomeLocation({this.latitude, this.longitude});

  factory CustomeLocation.fromJson(Map<String, dynamic> json) {
    return CustomeLocation(
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
