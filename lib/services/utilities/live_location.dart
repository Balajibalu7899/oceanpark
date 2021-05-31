import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import '/components/utilui/CustomSnackBar.dart';
import '/models/customer/location.dart';

class LiveLocation {
  Future<CustomeLocation> location(BuildContext context) async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return customeSnackBar(context, "Location permision denied");
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return customeSnackBar(context, "permission granted");
      }
    }

    _locationData = await location.getLocation();
    return CustomeLocation(
        latitude: _locationData.latitude, longitude: _locationData.longitude);
  }
}
