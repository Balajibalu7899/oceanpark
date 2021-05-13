import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customeSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: new Duration(seconds: 2),
      content: Text(message),
    ),
  );
}
