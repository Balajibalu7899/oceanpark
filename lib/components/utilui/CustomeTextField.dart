import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hinttext;
  CustomeTextField(
      {required this.controller,
      required this.label,
      required this.hinttext,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 45,
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          shadowColor: Theme.of(context).cardTheme.shadowColor,
          child: TextFormField(
            controller: controller,
            style: Theme.of(context).textTheme.headline4,
            decoration: InputDecoration(
              hintText: hinttext,
              labelText: label,
              labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
              contentPadding:
                  Theme.of(context).inputDecorationTheme.contentPadding,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
