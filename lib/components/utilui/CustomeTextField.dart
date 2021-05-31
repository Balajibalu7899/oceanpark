import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hinttext;
  final TextInputType? keyboardType;
  CustomeTextField(
      {required this.controller,
      required this.label,
      required this.hinttext,
      this.keyboardType,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: TextFormField(
          controller: controller,
          style: Theme.of(context).textTheme.headline6,
          keyboardType: keyboardType ?? TextInputType.text,
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
    );
  }
}
